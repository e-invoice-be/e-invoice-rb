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

      # Bank account number (for non-IBAN accounts)
      sig { returns(T.nilable(String)) }
      attr_accessor :bank_account_number

      # International Bank Account Number for payment transfers
      sig { returns(T.nilable(String)) }
      attr_accessor :iban

      # Structured payment reference or communication (e.g., structured communication
      # for Belgian bank transfers)
      sig { returns(T.nilable(String)) }
      attr_accessor :payment_reference

      # SWIFT/BIC code of the bank
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
        # Bank account number (for non-IBAN accounts)
        bank_account_number: nil,
        # International Bank Account Number for payment transfers
        iban: nil,
        # Structured payment reference or communication (e.g., structured communication
        # for Belgian bank transfers)
        payment_reference: nil,
        # SWIFT/BIC code of the bank
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
