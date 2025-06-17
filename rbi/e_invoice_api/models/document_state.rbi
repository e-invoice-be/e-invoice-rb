# typed: strong

module EInvoiceAPI
  module Models
    module DocumentState
      extend EInvoiceAPI::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentState) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DRAFT = T.let(:DRAFT, EInvoiceAPI::DocumentState::TaggedSymbol)
      TRANSIT = T.let(:TRANSIT, EInvoiceAPI::DocumentState::TaggedSymbol)
      FAILED = T.let(:FAILED, EInvoiceAPI::DocumentState::TaggedSymbol)
      SENT = T.let(:SENT, EInvoiceAPI::DocumentState::TaggedSymbol)
      RECEIVED = T.let(:RECEIVED, EInvoiceAPI::DocumentState::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoiceAPI::DocumentState::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
