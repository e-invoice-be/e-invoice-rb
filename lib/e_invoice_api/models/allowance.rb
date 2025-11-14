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
      #   to calculate the allowance amount. To state 20%, use value 20. Must be rounded
      #   to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :multiplier_factor, String, nil?: true

      # @!attribute reason
      #   The reason for the allowance
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   Allowance reason codes for invoice discounts and charges
      #
      #   @return [Symbol, EInvoiceAPI::Models::Allowance::ReasonCode, nil]
      optional :reason_code, enum: -> { EInvoiceAPI::Allowance::ReasonCode }, nil?: true

      # @!attribute tax_code
      #   The VAT category code that applies to the allowance
      #
      #   @return [Symbol, EInvoiceAPI::Models::Allowance::TaxCode, nil]
      optional :tax_code, enum: -> { EInvoiceAPI::Allowance::TaxCode }

      # @!attribute tax_rate
      #   The VAT rate, represented as percentage that applies to the allowance. Must be
      #   rounded to maximum 2 decimals
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
      #   @param reason_code [Symbol, EInvoiceAPI::Models::Allowance::ReasonCode, nil] Allowance reason codes for invoice discounts and charges
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::Allowance::TaxCode] The VAT category code that applies to the allowance
      #
      #   @param tax_rate [String, nil] The VAT rate, represented as percentage that applies to the allowance. Must be r

      # Allowance reason codes for invoice discounts and charges
      #
      # @see EInvoiceAPI::Models::Allowance#reason_code
      module ReasonCode
        extend EInvoiceAPI::Internal::Type::Enum

        REASON_CODE_41 = :"41"
        REASON_CODE_42 = :"42"
        REASON_CODE_60 = :"60"
        REASON_CODE_62 = :"62"
        REASON_CODE_63 = :"63"
        REASON_CODE_64 = :"64"
        REASON_CODE_65 = :"65"
        REASON_CODE_66 = :"66"
        REASON_CODE_67 = :"67"
        REASON_CODE_68 = :"68"
        REASON_CODE_70 = :"70"
        REASON_CODE_71 = :"71"
        REASON_CODE_88 = :"88"
        REASON_CODE_95 = :"95"
        REASON_CODE_100 = :"100"
        REASON_CODE_102 = :"102"
        REASON_CODE_103 = :"103"
        REASON_CODE_104 = :"104"
        REASON_CODE_105 = :"105"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The VAT category code that applies to the allowance
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
