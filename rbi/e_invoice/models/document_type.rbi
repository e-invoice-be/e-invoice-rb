# typed: strong

module EInvoice
  module Models
    module DocumentType
      extend EInvoice::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoice::DocumentType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVOICE = T.let(:INVOICE, EInvoice::DocumentType::TaggedSymbol)
      CREDIT_NOTE = T.let(:CREDIT_NOTE, EInvoice::DocumentType::TaggedSymbol)

      sig { override.returns(T::Array[EInvoice::DocumentType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
