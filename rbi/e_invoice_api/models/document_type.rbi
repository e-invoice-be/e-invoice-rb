# typed: strong

module EInvoiceAPI
  module Models
    module DocumentType
      extend EInvoiceAPI::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVOICE = T.let(:INVOICE, EInvoiceAPI::DocumentType::TaggedSymbol)
      CREDIT_NOTE = T.let(:CREDIT_NOTE, EInvoiceAPI::DocumentType::TaggedSymbol)
      DEBIT_NOTE = T.let(:DEBIT_NOTE, EInvoiceAPI::DocumentType::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoiceAPI::DocumentType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
