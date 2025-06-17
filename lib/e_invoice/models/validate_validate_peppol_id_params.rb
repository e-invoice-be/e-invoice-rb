# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Validate#validate_peppol_id
    class ValidateValidatePeppolIDParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      # @!attribute peppol_id
      #   Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
      #   Belgian company.
      #
      #   @return [String]
      required :peppol_id, String

      # @!method initialize(peppol_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoice::Models::ValidateValidatePeppolIDParams} for more details.
      #
      #   @param peppol_id [String] Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a Belgia
      #
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
