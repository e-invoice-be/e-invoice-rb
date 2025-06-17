# typed: strong

module EInvoice
  module Models
    module DocumentState
      extend EInvoice::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoice::DocumentState) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DRAFT = T.let(:DRAFT, EInvoice::DocumentState::TaggedSymbol)
      TRANSIT = T.let(:TRANSIT, EInvoice::DocumentState::TaggedSymbol)
      FAILED = T.let(:FAILED, EInvoice::DocumentState::TaggedSymbol)
      SENT = T.let(:SENT, EInvoice::DocumentState::TaggedSymbol)
      RECEIVED = T.let(:RECEIVED, EInvoice::DocumentState::TaggedSymbol)

      sig { override.returns(T::Array[EInvoice::DocumentState::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
