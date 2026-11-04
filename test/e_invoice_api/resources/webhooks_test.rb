# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::WebhooksTest < EInvoiceAPI::Test::ResourceTest
  def test_create_required_params
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.create(events: ["string"], url: "https://example.com")

    assert_pattern do
      response => EInvoiceAPI::WebhookResponse
    end

    assert_pattern do
      response => {
        id: String,
        events: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]),
        secret: String,
        url: String,
        enabled: EInvoiceAPI::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.retrieve("webhook_id")

    assert_pattern do
      response => EInvoiceAPI::WebhookResponse
    end

    assert_pattern do
      response => {
        id: String,
        events: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]),
        secret: String,
        url: String,
        enabled: EInvoiceAPI::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.update("webhook_id")

    assert_pattern do
      response => EInvoiceAPI::WebhookResponse
    end

    assert_pattern do
      response => {
        id: String,
        events: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]),
        secret: String,
        url: String,
        enabled: EInvoiceAPI::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.list

    assert_pattern do
      response => ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::WebhookResponse])
    end
  end

  def test_delete
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.delete("webhook_id")

    assert_pattern do
      response => EInvoiceAPI::Models::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        is_deleted: EInvoiceAPI::Internal::Type::Boolean
      }
    end
  end

  def test_history
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.history("webhook_id")

    assert_pattern do
      response => EInvoiceAPI::Models::WebhookHistoryResponse
    end

    assert_pattern do
      response => {
        history: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown]])
      }
    end
  end

  def test_test__required_params
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.webhooks.test_("webhook_id", data: {foo: "bar"}, event_type: "event_type")

    assert_pattern do
      response => EInvoiceAPI::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        message: String,
        success: EInvoiceAPI::Internal::Type::Boolean,
        webhook_delivery_result: ^(EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown])
      }
    end
  end
end
