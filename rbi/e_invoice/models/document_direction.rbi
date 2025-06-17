# typed: strong

module EInvoice
  module Models
    module DocumentDirection
      extend EInvoice::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoice::DocumentDirection) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INBOUND = T.let(:INBOUND, EInvoice::DocumentDirection::TaggedSymbol)
      OUTBOUND = T.let(:OUTBOUND, EInvoice::DocumentDirection::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoice::DocumentDirection::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
