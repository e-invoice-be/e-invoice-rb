# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class Charge < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute amount
      #   The charge amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :amount, String, nil?: true

      # @!attribute base_amount
      #   The base amount that may be used, in conjunction with the charge percentage, to
      #   calculate the charge amount. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :base_amount, String, nil?: true

      # @!attribute multiplier_factor
      #   The percentage that may be used, in conjunction with the charge base amount, to
      #   calculate the charge amount. To state 20%, use value 20
      #
      #   @return [String, nil]
      optional :multiplier_factor, String, nil?: true

      # @!attribute reason
      #   The reason for the charge
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   The code for the charge reason
      #
      #   @return [String, nil]
      optional :reason_code, String, nil?: true

      # @!attribute tax_code
      #   Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      #   @return [Symbol, EInvoiceAPI::Models::Charge::TaxCode, nil]
      optional :tax_code, enum: -> { EInvoiceAPI::Charge::TaxCode }, nil?: true

      # @!attribute tax_rate
      #   The VAT rate, represented as percentage that applies to the charge
      #
      #   @return [String, nil]
      optional :tax_rate, String, nil?: true

      # @!method initialize(amount: nil, base_amount: nil, multiplier_factor: nil, reason: nil, reason_code: nil, tax_code: nil, tax_rate: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::Charge} for more details.
      #
      #   A charge is an additional fee for example for late payment, late delivery, etc.
      #
      #   @param amount [String, nil] The charge amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @param base_amount [String, nil] The base amount that may be used, in conjunction with the charge percentage, to
      #
      #   @param multiplier_factor [String, nil] The percentage that may be used, in conjunction with the charge base amount, to
      #
      #   @param reason [String, nil] The reason for the charge
      #
      #   @param reason_code [String, nil] The code for the charge reason
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::Charge::TaxCode, nil] Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   @param tax_rate [String, nil] The VAT rate, represented as percentage that applies to the charge

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      # @see EInvoiceAPI::Models::Charge#tax_code
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        AE = :AE
        E = :E
        S = :S
        Z = :Z
        G = :G
        O = :O
        K = :K
        L = :L
        M = :M
        B = :B

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
