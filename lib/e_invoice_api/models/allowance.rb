# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class Allowance < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute amount
      #   The allowance amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :amount, String, nil?: true

      # @!attribute base_amount
      #   The base amount that may be used, in conjunction with the allowance percentage,
      #   to calculate the allowance amount. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :base_amount, String, nil?: true

      # @!attribute multiplier_factor
      #   The percentage that may be used, in conjunction with the allowance base amount,
      #   to calculate the allowance amount. To state 20%, use value 20
      #
      #   @return [String, nil]
      optional :multiplier_factor, String, nil?: true

      # @!attribute reason
      #   The reason for the allowance
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   The code for the allowance reason
      #
      #   @return [String, nil]
      optional :reason_code, String, nil?: true

      # @!attribute tax_code
      #   Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      #   @return [Symbol, EInvoiceAPI::Models::Allowance::TaxCode, nil]
      optional :tax_code, enum: -> { EInvoiceAPI::Allowance::TaxCode }, nil?: true

      # @!attribute tax_rate
      #   The VAT rate, represented as percentage that applies to the allowance
      #
      #   @return [String, nil]
      optional :tax_rate, String, nil?: true

      # @!method initialize(amount: nil, base_amount: nil, multiplier_factor: nil, reason: nil, reason_code: nil, tax_code: nil, tax_rate: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::Allowance} for more details.
      #
      #   An allowance is a discount for example for early payment, volume discount, etc.
      #
      #   @param amount [String, nil] The allowance amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @param base_amount [String, nil] The base amount that may be used, in conjunction with the allowance percentage,
      #
      #   @param multiplier_factor [String, nil] The percentage that may be used, in conjunction with the allowance base amount,
      #
      #   @param reason [String, nil] The reason for the allowance
      #
      #   @param reason_code [String, nil] The code for the allowance reason
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::Allowance::TaxCode, nil] Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   @param tax_rate [String, nil] The VAT rate, represented as percentage that applies to the allowance

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      # @see EInvoiceAPI::Models::Allowance#tax_code
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
