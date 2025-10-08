# typed: strong

module EInvoiceAPI
  module Models
    class Allowance < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::Allowance, EInvoiceAPI::Internal::AnyHash)
        end

      # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount

      # The base amount that may be used, in conjunction with the allowance percentage,
      # to calculate the allowance amount. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :base_amount

      # The percentage that may be used, in conjunction with the allowance base amount,
      # to calculate the allowance amount. To state 20%, use value 20
      sig { returns(T.nilable(String)) }
      attr_accessor :multiplier_factor

      # The reason for the allowance
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # The code for the allowance reason
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      sig { returns(T.nilable(EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)) }
      attr_accessor :tax_code

      # The VAT rate, represented as percentage that applies to the allowance
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_rate

      # An allowance is a discount for example for early payment, volume discount, etc.
      sig do
        params(
          amount: T.nilable(String),
          base_amount: T.nilable(String),
          multiplier_factor: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(String),
          tax_code: T.nilable(EInvoiceAPI::Allowance::TaxCode::OrSymbol),
          tax_rate: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
        amount: nil,
        # The base amount that may be used, in conjunction with the allowance percentage,
        # to calculate the allowance amount. Must be rounded to maximum 2 decimals
        base_amount: nil,
        # The percentage that may be used, in conjunction with the allowance base amount,
        # to calculate the allowance amount. To state 20%, use value 20
        multiplier_factor: nil,
        # The reason for the allowance
        reason: nil,
        # The code for the allowance reason
        reason_code: nil,
        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        tax_code: nil,
        # The VAT rate, represented as percentage that applies to the allowance
        tax_rate: nil
      )
      end

      sig do
        override.returns(
          {
            amount: T.nilable(String),
            base_amount: T.nilable(String),
            multiplier_factor: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            tax_code: T.nilable(EInvoiceAPI::Allowance::TaxCode::TaggedSymbol),
            tax_rate: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::Allowance::TaxCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE = T.let(:AE, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        E = T.let(:E, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        S = T.let(:S, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        Z = T.let(:Z, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        G = T.let(:G, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        O = T.let(:O, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        K = T.let(:K, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        L = T.let(:L, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        M = T.let(:M, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)
        B = T.let(:B, EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::Allowance::TaxCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
