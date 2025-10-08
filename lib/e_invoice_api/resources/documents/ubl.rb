# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Documents
      class Ubl
        # Create a new invoice or credit note from a UBL file
        #
        # @overload create_from_ubl(file:, request_options: {})
        #
        # @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::DocumentResponse]
        #
        # @see EInvoiceAPI::Models::Documents::UblCreateFromUblParams
        def create_from_ubl(params)
          parsed, options = EInvoiceAPI::Documents::UblCreateFromUblParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/documents/ubl",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: EInvoiceAPI::DocumentResponse,
            options: options
          )
        end

        # Get the UBL for an invoice or credit note
        #
        # @overload get(document_id, request_options: {})
        #
        # @param document_id [String]
        # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Documents::UblGetResponse]
        #
        # @see EInvoiceAPI::Models::Documents::UblGetParams
        def get(document_id, params = {})
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/ubl", document_id],
            model: EInvoiceAPI::Models::Documents::UblGetResponse,
            options: params[:request_options]
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
