# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Lookup#retrieve_participants
    class LookupRetrieveParticipantsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute query
      #   Query to lookup
      #
      #   @return [String]
      required :query, String

      # @!attribute country_code
      #   Country code of the company to lookup. If not provided, the search will be
      #   global.
      #
      #   @return [String, nil]
      optional :country_code, String, nil?: true

      # @!method initialize(query:, country_code: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::LookupRetrieveParticipantsParams} for more details.
      #
      #   @param query [String] Query to lookup
      #
      #   @param country_code [String, nil] Country code of the company to lookup. If not provided, the search will be globa
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
