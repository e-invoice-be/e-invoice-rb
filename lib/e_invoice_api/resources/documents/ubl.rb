# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Documents
      class Ubl
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
