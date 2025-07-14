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

      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::LookupRetrieveParticipantsParams} for more details.
      #
      # Lookup Peppol participants by name or other identifiers. You can limit the
      # search to a specific country by providing the country code.
      #
      # @overload retrieve_participants(query:, country_code: nil, request_options: {})
      #
      # @param query [String] Query to lookup
      #
      # @param country_code [String, nil] Country code of the company to lookup. If not provided, the search will be globa
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::LookupRetrieveParticipantsResponse]
      #
      # @see EInvoiceAPI::Models::LookupRetrieveParticipantsParams
      def retrieve_participants(params)
        parsed, options = EInvoiceAPI::LookupRetrieveParticipantsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/lookup/participants",
          query: parsed,
          model: EInvoiceAPI::Models::LookupRetrieveParticipantsResponse,
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
