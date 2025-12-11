# frozen_string_literal: true

module EInvoiceAPI
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
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Documents::DocumentAttachment]
        #
        # @see EInvoiceAPI::Models::Documents::AttachmentRetrieveParams
        def retrieve(attachment_id, params)
          parsed, options = EInvoiceAPI::Documents::AttachmentRetrieveParams.dump_request(params)
          document_id =
            parsed.delete(:document_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/attachments/%2$s", document_id, attachment_id],
            model: EInvoiceAPI::Documents::DocumentAttachment,
            options: options
          )
        end

        # Get all attachments for an invoice or credit note
        #
        # @overload list(document_id, request_options: {})
        #
        # @param document_id [String]
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<EInvoiceAPI::Models::Documents::DocumentAttachment>]
        #
        # @see EInvoiceAPI::Models::Documents::AttachmentListParams
        def list(document_id, params = {})
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/attachments", document_id],
            model: EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Documents::DocumentAttachment],
            options: params[:request_options]
          )
        end

        # Delete an attachment from an invoice or credit note
        #
        # @overload delete(attachment_id, document_id:, request_options: {})
        #
        # @param attachment_id [String]
        # @param document_id [String]
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Documents::AttachmentDeleteResponse]
        #
        # @see EInvoiceAPI::Models::Documents::AttachmentDeleteParams
        def delete(attachment_id, params)
          parsed, options = EInvoiceAPI::Documents::AttachmentDeleteParams.dump_request(params)
          document_id =
            parsed.delete(:document_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["api/documents/%1$s/attachments/%2$s", document_id, attachment_id],
            model: EInvoiceAPI::Models::Documents::AttachmentDeleteResponse,
            options: options
          )
        end

        # @deprecated
        #
        # Add one or more attachments when creating a new invoice or credit note via POST
        # /api/documents/
        #
        # @overload add(document_id, file:, request_options: {})
        #
        # @param document_id [String]
        # @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Documents::DocumentAttachment]
        #
        # @see EInvoiceAPI::Models::Documents::AttachmentAddParams
        def add(document_id, params)
          parsed, options = EInvoiceAPI::Documents::AttachmentAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["api/documents/%1$s/attachments", document_id],
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: EInvoiceAPI::Documents::DocumentAttachment,
            options: options
          )
        end

        # @api private
        #
        # @param client [EInvoiceAPI::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
