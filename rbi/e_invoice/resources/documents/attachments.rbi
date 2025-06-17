# typed: strong

module EInvoice
  module Resources
    class Documents
      class Attachments
        # Get attachment details with for an invoice or credit note with link to download
        # file (signed URL, valid for 1 hour)
        sig do
          params(
            attachment_id: String,
            document_id: String,
            request_options: EInvoice::RequestOptions::OrHash
          ).returns(EInvoice::Documents::DocumentAttachment)
        end
        def retrieve(attachment_id, document_id:, request_options: {})
        end

        # Get all attachments for an invoice or credit note
        sig do
          params(
            document_id: String,
            request_options: EInvoice::RequestOptions::OrHash
          ).returns(T::Array[EInvoice::Documents::DocumentAttachment])
        end
        def list(document_id, request_options: {})
        end

        # Delete an attachment from an invoice or credit note
        sig do
          params(
            attachment_id: String,
            document_id: String,
            request_options: EInvoice::RequestOptions::OrHash
          ).returns(EInvoice::Models::Documents::AttachmentDeleteResponse)
        end
        def delete(attachment_id, document_id:, request_options: {})
        end

        # Add a new attachment to an invoice or credit note
        sig do
          params(
            document_id: String,
            file: EInvoice::Internal::FileInput,
            request_options: EInvoice::RequestOptions::OrHash
          ).returns(EInvoice::Documents::DocumentAttachment)
        end
        def add(document_id, file:, request_options: {})
        end

        # @api private
        sig { params(client: EInvoice::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
