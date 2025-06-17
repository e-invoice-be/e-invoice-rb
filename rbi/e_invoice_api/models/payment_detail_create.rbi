# typed: strong

module EInvoiceAPI
  module Models
    class PaymentDetailCreate < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::PaymentDetailCreate,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :bank_account_number

      sig { returns(T.nilable(String)) }
      attr_accessor :iban

      sig { returns(T.nilable(String)) }
      attr_accessor :payment_reference

      sig { returns(T.nilable(String)) }
      attr_accessor :swift

      sig do
        params(
          bank_account_number: T.nilable(String),
          iban: T.nilable(String),
          payment_reference: T.nilable(String),
          swift: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        bank_account_number: nil,
        iban: nil,
        payment_reference: nil,
        swift: nil
      )
      end

      sig do
        override.returns(
          {
            bank_account_number: T.nilable(String),
            iban: T.nilable(String),
            payment_reference: T.nilable(String),
            swift: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
