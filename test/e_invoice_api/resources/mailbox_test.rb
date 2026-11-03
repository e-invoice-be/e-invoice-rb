# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::MailboxTest < EInvoiceAPI::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @e_invoice.mailbox.list

    assert_pattern do
      response => EInvoiceAPI::Internal::DocumentsNumberPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => EInvoiceAPI::InboundEmailResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        message_id: String,
        sender_email: String,
        attachment_count: Integer | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::InboundEmailResponse::Attachment]) | nil,
        bcc_addresses: String | nil,
        cc_addresses: String | nil,
        document_id: String | nil,
        error_message: String | nil,
        processed: EInvoiceAPI::Internal::Type::Boolean | nil,
        processed_at: Time | nil,
        received_at: Time | nil,
        sender_name: String | nil,
        subject: String | nil,
        to_addresses: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @e_invoice.mailbox.retrieve("inbound_email_id")

    assert_pattern do
      response => EInvoiceAPI::InboundEmailResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        message_id: String,
        sender_email: String,
        attachment_count: Integer | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::InboundEmailResponse::Attachment]) | nil,
        bcc_addresses: String | nil,
        cc_addresses: String | nil,
        document_id: String | nil,
        error_message: String | nil,
        processed: EInvoiceAPI::Internal::Type::Boolean | nil,
        processed_at: Time | nil,
        received_at: Time | nil,
        sender_name: String | nil,
        subject: String | nil,
        to_addresses: String | nil
      }
    end
  end

  def test_download_attachment_required_params
    skip("Mock server tests are disabled")

    response = @e_invoice.mailbox.download_attachment("filename", inbound_email_id: "inbound_email_id")

    assert_pattern do
      response => EInvoiceAPI::Internal::Type::Unknown
    end
  end

  def test_reprocess
    skip("Mock server tests are disabled")

    response = @e_invoice.mailbox.reprocess("inbound_email_id")

    assert_pattern do
      response => EInvoiceAPI::InboundEmailResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        message_id: String,
        sender_email: String,
        attachment_count: Integer | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::InboundEmailResponse::Attachment]) | nil,
        bcc_addresses: String | nil,
        cc_addresses: String | nil,
        document_id: String | nil,
        error_message: String | nil,
        processed: EInvoiceAPI::Internal::Type::Boolean | nil,
        processed_at: Time | nil,
        received_at: Time | nil,
        sender_name: String | nil,
        subject: String | nil,
        to_addresses: String | nil
      }
    end
  end
end
