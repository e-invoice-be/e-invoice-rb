# typed: strong

module EInvoiceAPI
  module Models
    class Charge < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::Charge, EInvoiceAPI::Internal::AnyHash)
        end

      # The charge amount, without VAT. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount

      # The base amount that may be used, in conjunction with the charge percentage, to
      # calculate the charge amount. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :base_amount

      # The percentage that may be used, in conjunction with the charge base amount, to
      # calculate the charge amount. To state 20%, use value 20
      sig { returns(T.nilable(String)) }
      attr_accessor :multiplier_factor

      # The reason for the charge
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # The code for the charge reason
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      sig { returns(T.nilable(EInvoiceAPI::Charge::TaxCode::TaggedSymbol)) }
      attr_accessor :tax_code

      # The VAT rate, represented as percentage that applies to the charge
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_rate

      # A charge is an additional fee for example for late payment, late delivery, etc.
      sig do
        params(
          amount: T.nilable(String),
          base_amount: T.nilable(String),
          multiplier_factor: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(String),
          tax_code: T.nilable(EInvoiceAPI::Charge::TaxCode::OrSymbol),
          tax_rate: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The charge amount, without VAT. Must be rounded to maximum 2 decimals
        amount: nil,
        # The base amount that may be used, in conjunction with the charge percentage, to
        # calculate the charge amount. Must be rounded to maximum 2 decimals
        base_amount: nil,
        # The percentage that may be used, in conjunction with the charge base amount, to
        # calculate the charge amount. To state 20%, use value 20
        multiplier_factor: nil,
        # The reason for the charge
        reason: nil,
        # The code for the charge reason
        reason_code: nil,
        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        tax_code: nil,
        # The VAT rate, represented as percentage that applies to the charge
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
            tax_code: T.nilable(EInvoiceAPI::Charge::TaxCode::TaggedSymbol),
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::Charge::TaxCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE = T.let(:AE, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        E = T.let(:E, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        S = T.let(:S, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        Z = T.let(:Z, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        G = T.let(:G, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        O = T.let(:O, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        K = T.let(:K, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        L = T.let(:L, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        M = T.let(:M, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        B = T.let(:B, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)

        sig do
          override.returns(T::Array[EInvoiceAPI::Charge::TaxCode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
