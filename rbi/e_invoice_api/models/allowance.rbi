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
      # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
      # to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :multiplier_factor

      # The reason for the allowance
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Allowance reason codes for invoice discounts and charges
      sig do
        returns(T.nilable(EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol))
      end
      attr_accessor :reason_code

      # The VAT category code that applies to the allowance
      sig { returns(T.nilable(EInvoiceAPI::Allowance::TaxCode::TaggedSymbol)) }
      attr_reader :tax_code

      sig { params(tax_code: EInvoiceAPI::Allowance::TaxCode::OrSymbol).void }
      attr_writer :tax_code

      # The VAT rate, represented as percentage that applies to the allowance. Must be
      # rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_rate

      # An allowance is a discount for example for early payment, volume discount, etc.
      sig do
        params(
          amount: T.nilable(String),
          base_amount: T.nilable(String),
          multiplier_factor: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(EInvoiceAPI::Allowance::ReasonCode::OrSymbol),
          tax_code: EInvoiceAPI::Allowance::TaxCode::OrSymbol,
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
        # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
        # to maximum 2 decimals
        multiplier_factor: nil,
        # The reason for the allowance
        reason: nil,
        # Allowance reason codes for invoice discounts and charges
        reason_code: nil,
        # The VAT category code that applies to the allowance
        tax_code: nil,
        # The VAT rate, represented as percentage that applies to the allowance. Must be
        # rounded to maximum 2 decimals
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
            reason_code:
              T.nilable(EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol),
            tax_code: EInvoiceAPI::Allowance::TaxCode::TaggedSymbol,
            tax_rate: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Allowance reason codes for invoice discounts and charges
      module ReasonCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::Allowance::ReasonCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REASON_CODE_41 =
          T.let(:"41", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_42 =
          T.let(:"42", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_60 =
          T.let(:"60", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_62 =
          T.let(:"62", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_63 =
          T.let(:"63", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_64 =
          T.let(:"64", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_65 =
          T.let(:"65", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_66 =
          T.let(:"66", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_67 =
          T.let(:"67", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_68 =
          T.let(:"68", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_70 =
          T.let(:"70", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_71 =
          T.let(:"71", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_88 =
          T.let(:"88", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_95 =
          T.let(:"95", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_100 =
          T.let(:"100", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_102 =
          T.let(:"102", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_103 =
          T.let(:"103", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_104 =
          T.let(:"104", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)
        REASON_CODE_105 =
          T.let(:"105", EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::Allowance::ReasonCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The VAT category code that applies to the allowance
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
