# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::WebhooksTest < EInvoiceAPI::Test::ResourceTest
  def test_create_required_params
    skip("skipped: tests are disabled for the time being")

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
    skip("skipped: tests are disabled for the time being")

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
    skip("skipped: tests are disabled for the time being")

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
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.webhooks.list

    assert_pattern do
      response => ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::WebhookResponse])
    end
  end

  def test_delete
    skip("skipped: tests are disabled for the time being")

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
end
