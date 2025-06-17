# frozen_string_literal: true

require_relative "../../test_helper"

class EInvoice::Test::Resources::Documents::AttachmentsTest < EInvoice::Test::ResourceTest
  def test_retrieve_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.retrieve("attachment_id", document_id: "document_id")

    assert_pattern do
      response => EInvoice::Documents::DocumentAttachment
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
      response => ^(EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment])
    end
  end

  def test_delete_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.delete("attachment_id", document_id: "document_id")

    assert_pattern do
      response => EInvoice::Models::Documents::AttachmentDeleteResponse
    end

    assert_pattern do
      response => {
        is_deleted: EInvoice::Internal::Type::Boolean
      }
    end
  end

  def test_add_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.attachments.add("document_id", file: Pathname(__FILE__))

    assert_pattern do
      response => EInvoice::Documents::DocumentAttachment
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
