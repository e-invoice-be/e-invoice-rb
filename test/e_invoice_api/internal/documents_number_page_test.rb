# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::DocumentsNumberPageTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  BASE_URL = "http://documents-number-page.test"

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def client
    @client ||= EInvoiceAPI::Client.new(base_url: BASE_URL, api_key: "My API Key", max_retries: 0)
  end

  def document(id) = {id: id, created_at: "2026-11-24T00:00:00Z"}

  def documents(range) = range.map { document("doc_#{_1}") }

  def inbound_email(id)
    {
      id: id,
      created_at: "2026-11-24T00:00:00Z",
      message_id: "<#{id}@example.com>",
      sender_email: "a@example.com"
    }
  end

  # Stubs `path` so that each `page` query value returns the body built by `bodies[page]`.
  # A request without a `page` query is treated as page 1.
  def stub_pages(path, bodies)
    stub_request(:get, %r{\A#{Regexp.escape(BASE_URL)}/#{Regexp.escape(path)}(\?.*)?\z}).to_return do |req|
      page = (req.uri.query_values || {}).fetch("page", "1").to_i
      body = bodies.fetch(page) do
        {items: [], page: page, page_size: 10, total: 0, pages: 0, has_next_page: false}
      end
      {status: 200, headers: {"Content-Type" => "application/json"}, body: JSON.generate(body)}
    end
  end

  def assert_page_requested(path, page, times: 1)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/#{Regexp.escape(path)}}, times: times) do |req|
      (req.uri.query_values || {}).fetch("page", "1").to_i == page
    end
  end

  def test_auto_paging_each_stops_after_last_page_when_total_exceeds_pages
    bodies = {
      1 => {
        items: documents(1..10),
        page: 1,
        page_size: 10,
        total: 25,
        pages: 3,
        has_next_page: true
      },
      2 => {
        items: documents(11..20),
        page: 2,
        page_size: 10,
        total: 25,
        pages: 3,
        has_next_page: true
      },
      3 => {
        items: documents(21..25),
        page: 3,
        page_size: 10,
        total: 25,
        pages: 3,
        has_next_page: false
      }
    }
    stub_pages("api/inbox/", bodies)

    ids = []
    client.inbox.list.auto_paging_each { ids << _1.id }

    assert_equal((1..25).map { "doc_#{_1}" }, ids)
    assert_page_requested("api/inbox/", 1)
    assert_page_requested("api/inbox/", 2)
    assert_page_requested("api/inbox/", 3)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/}, times: 3)
  end

  def test_auto_paging_each_uses_pages_when_has_next_page_is_absent
    bodies = {
      1 => {items: [document("doc_1")], page: 1, page_size: 1, total: 25, pages: 2},
      2 => {items: [document("doc_2")], page: 2, page_size: 1, total: 25, pages: 2}
    }
    stub_pages("api/inbox/invoices", bodies)

    ids = []
    client.inbox.list_invoices.auto_paging_each { ids << _1.id }

    assert_equal(%w[doc_1 doc_2], ids)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/}, times: 2)
  end

  def test_has_next_page_false_wins_over_pages
    stub_pages(
      "api/inbox/",
      {1 => {items: [document("doc_1")], page: 1, page_size: 10, total: 50, pages: 5, has_next_page: false}}
    )

    page = client.inbox.list

    refute_predicate(page, :next_page?)
    ids = []
    page.auto_paging_each { ids << _1.id }
    assert_equal(%w[doc_1], ids)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/}, times: 1)
  end

  def test_has_next_page_true_on_empty_page_does_not_continue
    stub_pages(
      "api/inbox/",
      {1 => {items: [], page: 1, page_size: 10, total: 0, pages: 0, has_next_page: true}}
    )

    refute_predicate(client.inbox.list, :next_page?)
  end

  def test_falls_back_to_items_when_pagination_metadata_is_missing
    bodies = {
      1 => {items: [document("doc_1"), document("doc_2")], page: 1, page_size: 2, total: 3},
      2 => {items: [document("doc_3")], page: 2, page_size: 2, total: 3},
      3 => {items: [], page: 3, page_size: 2, total: 3}
    }
    stub_pages("api/inbox/credit-notes", bodies)

    page = client.inbox.list_credit_notes
    assert_nil(page.pages)
    assert_nil(page.has_next_page)
    assert_predicate(page, :next_page?)

    ids = []
    page.auto_paging_each { ids << _1.id }

    assert_equal(%w[doc_1 doc_2 doc_3], ids)
    assert_page_requested("api/inbox/credit-notes", 1)
    assert_page_requested("api/inbox/credit-notes", 2)
    assert_page_requested("api/inbox/credit-notes", 3)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/}, times: 3)
  end

  def test_accessors_expose_body_values_and_next_page_raises_on_last_page
    stub_pages(
      "api/inbox/",
      {
        1 => {items: [document("doc_1")], page: 1, page_size: 10, total: 21, pages: 3, has_next_page: true},
        3 => {items: [document("doc_21")], page: 3, page_size: 10, total: 21, pages: 3, has_next_page: false}
      }
    )

    first = client.inbox.list
    assert_equal(1, first.page)
    assert_equal(10, first.page_size)
    assert_equal(21, first.total)
    assert_equal(3, first.pages)
    assert_equal(true, first.has_next_page)
    assert_predicate(first, :next_page?)
    assert_kind_of(EInvoiceAPI::Models::DocumentResponse, first.items.first)

    last = client.inbox.list(page: 3)
    assert_equal(3, last.page)
    assert_equal(21, last.total)
    assert_equal(3, last.pages)
    assert_equal(false, last.has_next_page)
    refute_predicate(last, :next_page?)
    assert_raises(RuntimeError) { last.next_page }
  end

  def test_next_page_requests_following_page_number
    stub_pages(
      "api/inbox/",
      {
        1 => {items: [document("doc_1")], page: 1, page_size: 1, total: 2, pages: 2, has_next_page: true},
        2 => {items: [document("doc_2")], page: 2, page_size: 1, total: 2, pages: 2, has_next_page: false}
      }
    )

    second = client.inbox.list.next_page

    assert_equal(2, second.page)
    assert_equal(%w[doc_2], second.items.map(&:id))
    assert_page_requested("api/inbox/", 2)
  end

  def test_inspect_includes_pages_and_has_next_page
    stub_pages(
      "api/inbox/",
      {1 => {items: [document("doc_1")], page: 1, page_size: 10, total: 25, pages: 3, has_next_page: true}}
    )

    inspected = client.inbox.list.inspect

    assert_match(/total=25/, inspected)
    assert_match(/pages=3/, inspected)
    assert_match(/has_next_page=true/, inspected)
  end

  def test_mailbox_list_pages_inbound_emails
    bodies = {
      1 => {
        items: [inbound_email("mail_1"), inbound_email("mail_2")],
        page: 1,
        page_size: 2,
        total: 3,
        pages: 2,
        has_next_page: true
      },
      2 => {items: [inbound_email("mail_3")], page: 2, page_size: 2, total: 3, pages: 2, has_next_page: false}
    }
    stub_pages("api/mailbox/", bodies)

    emails = []
    client.mailbox.list.auto_paging_each { emails << _1 }

    assert_equal(%w[mail_1 mail_2 mail_3], emails.map(&:id))
    assert_kind_of(EInvoiceAPI::Models::InboundEmailResponse, emails.first)
    assert_requested(:get, %r{\A#{Regexp.escape(BASE_URL)}/}, times: 2)
  end
end
