# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Me#retrieve
    class MeRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute credit_balance
      #   Credit balance of the tenant
      #
      #   @return [Integer]
      required :credit_balance, Integer

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute plan
      #   Plan of the tenant
      #
      #   @return [Symbol, EInvoiceAPI::Models::MeRetrieveResponse::Plan]
      required :plan, enum: -> { EInvoiceAPI::Models::MeRetrieveResponse::Plan }

      # @!attribute bcc_recipient_email
      #   BCC recipient email to deliver documents
      #
      #   @return [String, nil]
      optional :bcc_recipient_email, String, nil?: true

      # @!attribute company_address
      #   Address of the company
      #
      #   @return [String, nil]
      optional :company_address, String, nil?: true

      # @!attribute company_city
      #   City of the company
      #
      #   @return [String, nil]
      optional :company_city, String, nil?: true

      # @!attribute company_country
      #   Country of the company
      #
      #   @return [String, nil]
      optional :company_country, String, nil?: true

      # @!attribute company_email
      #   Email of the company
      #
      #   @return [String, nil]
      optional :company_email, String, nil?: true

      # @!attribute company_name
      #   Name of the company
      #
      #   @return [String, nil]
      optional :company_name, String, nil?: true

      # @!attribute company_number
      #   Company number
      #
      #   @return [String, nil]
      optional :company_number, String, nil?: true

      # @!attribute company_zip
      #   Zip code of the company
      #
      #   @return [String, nil]
      optional :company_zip, String, nil?: true

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute ibans
      #   IBANs of the tenant
      #
      #   @return [Array<String>, nil]
      optional :ibans, EInvoiceAPI::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute peppol_ids
      #   Peppol IDs of the tenant
      #
      #   @return [Array<String>, nil]
      optional :peppol_ids, EInvoiceAPI::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute smp_registration
      #   Whether the tenant is registered on our SMP
      #
      #   @return [Boolean, nil]
      optional :smp_registration, EInvoiceAPI::Internal::Type::Boolean, nil?: true

      # @!attribute smp_registration_date
      #   Date when the tenant was registered on SMP
      #
      #   @return [Time, nil]
      optional :smp_registration_date, Time, nil?: true

      # @!method initialize(credit_balance:, name:, plan:, bcc_recipient_email: nil, company_address: nil, company_city: nil, company_country: nil, company_email: nil, company_name: nil, company_number: nil, company_zip: nil, description: nil, ibans: nil, peppol_ids: nil, smp_registration: nil, smp_registration_date: nil)
      #   @param credit_balance [Integer] Credit balance of the tenant
      #
      #   @param name [String]
      #
      #   @param plan [Symbol, EInvoiceAPI::Models::MeRetrieveResponse::Plan] Plan of the tenant
      #
      #   @param bcc_recipient_email [String, nil] BCC recipient email to deliver documents
      #
      #   @param company_address [String, nil] Address of the company
      #
      #   @param company_city [String, nil] City of the company
      #
      #   @param company_country [String, nil] Country of the company
      #
      #   @param company_email [String, nil] Email of the company
      #
      #   @param company_name [String, nil] Name of the company
      #
      #   @param company_number [String, nil] Company number
      #
      #   @param company_zip [String, nil] Zip code of the company
      #
      #   @param description [String, nil]
      #
      #   @param ibans [Array<String>, nil] IBANs of the tenant
      #
      #   @param peppol_ids [Array<String>, nil] Peppol IDs of the tenant
      #
      #   @param smp_registration [Boolean, nil] Whether the tenant is registered on our SMP
      #
      #   @param smp_registration_date [Time, nil] Date when the tenant was registered on SMP

      # Plan of the tenant
      #
      # @see EInvoiceAPI::Models::MeRetrieveResponse#plan
      module Plan
        extend EInvoiceAPI::Internal::Type::Enum

        STARTER = :starter
        PRO = :pro
        ENTERPRISE = :enterprise

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
