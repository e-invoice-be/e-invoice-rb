# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Lookup
      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::LookupRetrieveParams} for more details.
      #
      # Lookup Peppol ID. The peppol_id must be in the form of `<scheme>:<id>`. The
      # scheme is a 4-digit code representing the identifier scheme, and the id is the
      # actual identifier value. For example, for a Belgian company it is
      # `0208:0123456789` (where 0208 is the scheme for Belgian enterprises, followed by
      # the 10 digits of the official BTW / KBO number).
      #
      # @overload retrieve(peppol_id:, request_options: {})
      #
      # @param peppol_id [String] Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a Belgia
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::LookupRetrieveResponse]
      #
      # @see EInvoiceAPI::Models::LookupRetrieveParams
      def retrieve(params)
        parsed, options = EInvoiceAPI::LookupRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/lookup",
          query: parsed,
          model: EInvoiceAPI::Models::LookupRetrieveResponse,
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
