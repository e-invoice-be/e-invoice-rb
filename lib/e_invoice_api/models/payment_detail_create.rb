# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class PaymentDetailCreate < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute bank_account_number
      #
      #   @return [String, nil]
      optional :bank_account_number, String, nil?: true

      # @!attribute iban
      #
      #   @return [String, nil]
      optional :iban, String, nil?: true

      # @!attribute payment_reference
      #
      #   @return [String, nil]
      optional :payment_reference, String, nil?: true

      # @!attribute swift
      #
      #   @return [String, nil]
      optional :swift, String, nil?: true

      # @!method initialize(bank_account_number: nil, iban: nil, payment_reference: nil, swift: nil)
      #   @param bank_account_number [String, nil]
      #   @param iban [String, nil]
      #   @param payment_reference [String, nil]
      #   @param swift [String, nil]
    end
  end
end
