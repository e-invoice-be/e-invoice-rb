# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class PaymentDetailCreate < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute bank_account_number
      #   Bank account number (for non-IBAN accounts)
      #
      #   @return [String, nil]
      optional :bank_account_number, String, nil?: true

      # @!attribute iban
      #   International Bank Account Number for payment transfers
      #
      #   @return [String, nil]
      optional :iban, String, nil?: true

      # @!attribute payment_reference
      #   Structured payment reference or communication (e.g., structured communication
      #   for Belgian bank transfers)
      #
      #   @return [String, nil]
      optional :payment_reference, String, nil?: true

      # @!attribute swift
      #   SWIFT/BIC code of the bank
      #
      #   @return [String, nil]
      optional :swift, String, nil?: true

      # @!method initialize(bank_account_number: nil, iban: nil, payment_reference: nil, swift: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::PaymentDetailCreate} for more details.
      #
      #   @param bank_account_number [String, nil] Bank account number (for non-IBAN accounts)
      #
      #   @param iban [String, nil] International Bank Account Number for payment transfers
      #
      #   @param payment_reference [String, nil] Structured payment reference or communication (e.g., structured communication fo
      #
      #   @param swift [String, nil] SWIFT/BIC code of the bank
    end
  end
end
