# frozen_string_literal: true

module EInvoice
  module Resources
    class Documents
      class Attachments
        # Get attachment details with for an invoice or credit note with link to download
        # file (signed URL, valid for 1 hour)
        #
        # @overload retrieve(attachment_id, document_id:, request_options: {})
        #
        # @param attachment_id [String]
        # @param document_id [String]
        # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoice::Models::Documents::DocumentAttachment]
        #
        # @see EInvoice::Models::Documents::AttachmentRetrieveParams
        def retrieve(attachment_id, params)
          parsed, options = EInvoice::Documents::AttachmentRetrieveParams.dump_request(params)
          document_id =
            parsed.delete(:document_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/attachments/%2$s", document_id, attachment_id],
            model: EInvoice::Documents::DocumentAttachment,
            options: options
          )
        end

        # Get all attachments for an invoice or credit note
        #
        # @overload list(document_id, request_options: {})
        #
        # @param document_id [String]
        # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<EInvoice::Models::Documents::DocumentAttachment>]
        #
        # @see EInvoice::Models::Documents::AttachmentListParams
        def list(document_id, params = {})
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/attachments", document_id],
            model: EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment],
            options: params[:request_options]
          )
        end

        # Delete an attachment from an invoice or credit note
        #
        # @overload delete(attachment_id, document_id:, request_options: {})
        #
        # @param attachment_id [String]
        # @param document_id [String]
        # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoice::Models::Documents::AttachmentDeleteResponse]
        #
        # @see EInvoice::Models::Documents::AttachmentDeleteParams
        def delete(attachment_id, params)
          parsed, options = EInvoice::Documents::AttachmentDeleteParams.dump_request(params)
          document_id =
            parsed.delete(:document_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["api/documents/%1$s/attachments/%2$s", document_id, attachment_id],
            model: EInvoice::Models::Documents::AttachmentDeleteResponse,
            options: options
          )
        end

        # Add a new attachment to an invoice or credit note
        #
        # @overload add(document_id, file:, request_options: {})
        #
        # @param document_id [String]
        # @param file [Pathname, StringIO, IO, String, EInvoice::FilePart]
        # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoice::Models::Documents::DocumentAttachment]
        #
        # @see EInvoice::Models::Documents::AttachmentAddParams
        def add(document_id, params)
          parsed, options = EInvoice::Documents::AttachmentAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["api/documents/%1$s/attachments", document_id],
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: EInvoice::Documents::DocumentAttachment,
            options: options
          )
        end

        # @api private
        #
        # @param client [EInvoice::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
