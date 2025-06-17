# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Validate#validate_json
    class UblDocumentValidation < EInvoice::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute file_name
      #
      #   @return [String, nil]
      required :file_name, String, nil?: true

      # @!attribute is_valid
      #
      #   @return [Boolean]
      required :is_valid, EInvoice::Internal::Type::Boolean

      # @!attribute issues
      #
      #   @return [Array<EInvoice::Models::UblDocumentValidation::Issue>]
      required :issues, -> { EInvoice::Internal::Type::ArrayOf[EInvoice::UblDocumentValidation::Issue] }

      # @!attribute ubl_document
      #
      #   @return [String, nil]
      optional :ubl_document, String, nil?: true

      # @!method initialize(id:, file_name:, is_valid:, issues:, ubl_document: nil)
      #   @param id [String]
      #   @param file_name [String, nil]
      #   @param is_valid [Boolean]
      #   @param issues [Array<EInvoice::Models::UblDocumentValidation::Issue>]
      #   @param ubl_document [String, nil]

      class Issue < EInvoice::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!attribute schematron
        #
        #   @return [String]
        required :schematron, String

        # @!attribute type
        #
        #   @return [Symbol, EInvoice::Models::UblDocumentValidation::Issue::Type]
        required :type, enum: -> { EInvoice::UblDocumentValidation::Issue::Type }

        # @!attribute flag
        #
        #   @return [String, nil]
        optional :flag, String, nil?: true

        # @!attribute location
        #
        #   @return [String, nil]
        optional :location, String, nil?: true

        # @!attribute rule_id
        #
        #   @return [String, nil]
        optional :rule_id, String, nil?: true

        # @!attribute test_
        #
        #   @return [String, nil]
        optional :test_, String, api_name: :test, nil?: true

        # @!method initialize(message:, schematron:, type:, flag: nil, location: nil, rule_id: nil, test_: nil)
        #   @param message [String]
        #   @param schematron [String]
        #   @param type [Symbol, EInvoice::Models::UblDocumentValidation::Issue::Type]
        #   @param flag [String, nil]
        #   @param location [String, nil]
        #   @param rule_id [String, nil]
        #   @param test_ [String, nil]

        # @see EInvoice::Models::UblDocumentValidation::Issue#type
        module Type
          extend EInvoice::Internal::Type::Enum

          ERROR = :error
          WARNING = :warning

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
