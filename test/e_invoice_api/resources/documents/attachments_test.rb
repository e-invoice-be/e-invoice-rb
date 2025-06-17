# frozen_string_literal: true

require_relative "../../test_helper"

class EInvoiceAPI::Test::Resources::Documents::AttachmentsTest < EInvoiceAPI::Test::ResourceTest
  def test_retrieve_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.retrieve("attachment_id", document_id: "document_id")

    assert_pattern do
      response => EInvoiceAPI::Documents::DocumentAttachment
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String,
        file_size: Integer | nil,
        file_type: String | nil,
        file_url: String | nil
      }
    end
  end

  def test_list
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.list("document_id")

    assert_pattern do
      response => ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Documents::DocumentAttachment])
    end
  end

  def test_delete_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.delete("attachment_id", document_id: "document_id")

    assert_pattern do
      response => EInvoiceAPI::Models::Documents::AttachmentDeleteResponse
    end

    assert_pattern do
      response => {
        is_deleted: EInvoiceAPI::Internal::Type::Boolean
      }
    end
  end

  def test_add_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.add("document_id", file: Pathname(__FILE__))

    assert_pattern do
      response => EInvoiceAPI::Documents::DocumentAttachment
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String,
        file_size: Integer | nil,
        file_type: String | nil,
        file_url: String | nil
      }
    end
  end
end
