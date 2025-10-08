# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Me
      # Retrieve information about your account.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::MeRetrieveResponse]
      #
      # @see EInvoiceAPI::Models::MeRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "api/me/",
          model: EInvoiceAPI::Models::MeRetrieveResponse,
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
