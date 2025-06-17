# frozen_string_literal: true

module EInvoice
  module Models
    module DocumentType
      extend EInvoice::Internal::Type::Enum

      INVOICE = :INVOICE
      CREDIT_NOTE = :CREDIT_NOTE

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
