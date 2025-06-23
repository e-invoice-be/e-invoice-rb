# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module DocumentType
      extend EInvoiceAPI::Internal::Type::Enum

      INVOICE = :INVOICE
      CREDIT_NOTE = :CREDIT_NOTE
      DEBIT_NOTE = :DEBIT_NOTE

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
