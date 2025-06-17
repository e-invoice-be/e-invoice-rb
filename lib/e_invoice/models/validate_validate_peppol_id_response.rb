# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Validate#validate_peppol_id
    class ValidateValidatePeppolIDResponse < EInvoice::Internal::Type::BaseModel
      # @!attribute business_card
      #   Business card information for the Peppol ID
      #
      #   @return [EInvoice::Models::ValidateValidatePeppolIDResponse::BusinessCard, nil]
      required :business_card,
               -> { EInvoice::Models::ValidateValidatePeppolIDResponse::BusinessCard },
               nil?: true

      # @!attribute business_card_valid
      #   Whether a business card is set at the SMP
      #
      #   @return [Boolean]
      required :business_card_valid, EInvoice::Internal::Type::Boolean

      # @!attribute dns_valid
      #   Whether the DNS resolves to a valid SMP
      #
      #   @return [Boolean]
      required :dns_valid, EInvoice::Internal::Type::Boolean

      # @!attribute is_valid
      #   Whether the Peppol ID is valid and registered in the Peppol network
      #
      #   @return [Boolean]
      required :is_valid, EInvoice::Internal::Type::Boolean

      # @!attribute supported_document_types
      #
      #   @return [Array<String>, nil]
      optional :supported_document_types, EInvoice::Internal::Type::ArrayOf[String]

      # @!method initialize(business_card:, business_card_valid:, dns_valid:, is_valid:, supported_document_types: nil)
      #   Response for a Peppol ID validation request.
      #
      #   This model represents the validation result of a Peppol ID in the Peppol
      #   network, including whether the ID is valid and what document types it supports.
      #
      #   @param business_card [EInvoice::Models::ValidateValidatePeppolIDResponse::BusinessCard, nil] Business card information for the Peppol ID
      #
      #   @param business_card_valid [Boolean] Whether a business card is set at the SMP
      #
      #   @param dns_valid [Boolean] Whether the DNS resolves to a valid SMP
      #
      #   @param is_valid [Boolean] Whether the Peppol ID is valid and registered in the Peppol network
      #
      #   @param supported_document_types [Array<String>]

      # @see EInvoice::Models::ValidateValidatePeppolIDResponse#business_card
      class BusinessCard < EInvoice::Internal::Type::BaseModel
        # @!attribute country_code
        #
        #   @return [String, nil]
        optional :country_code, String, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute registration_date
        #
        #   @return [Date, nil]
        optional :registration_date, Date, nil?: true

        # @!method initialize(country_code: nil, name: nil, registration_date: nil)
        #   Business card information for the Peppol ID
        #
        #   @param country_code [String, nil]
        #   @param name [String, nil]
        #   @param registration_date [Date, nil]
      end
    end
  end
end
