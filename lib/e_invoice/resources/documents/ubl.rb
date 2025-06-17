# frozen_string_literal: true

module EInvoice
  module Resources
    class Documents
      class Ubl
        # Get the UBL for an invoice or credit note
        #
        # @overload get(document_id, request_options: {})
        #
        # @param document_id [String]
        # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoice::Models::Documents::UblGetResponse]
        #
        # @see EInvoice::Models::Documents::UblGetParams
        def get(document_id, params = {})
          @client.request(
            method: :get,
            path: ["api/documents/%1$s/ubl", document_id],
            model: EInvoice::Models::Documents::UblGetResponse,
            options: params[:request_options]
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
