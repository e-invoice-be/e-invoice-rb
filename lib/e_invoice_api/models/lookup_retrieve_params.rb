# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Lookup#retrieve
    class LookupRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute peppol_id
      #   Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
      #   Belgian company.
      #
      #   @return [String]
      required :peppol_id, String

      # @!method initialize(peppol_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::LookupRetrieveParams} for more details.
      #
      #   @param peppol_id [String] Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a Belgia
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
