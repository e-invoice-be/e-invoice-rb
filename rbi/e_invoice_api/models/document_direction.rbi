# typed: strong

module EInvoiceAPI
  module Models
    module DocumentDirection
      extend EInvoiceAPI::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentDirection) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INBOUND = T.let(:INBOUND, EInvoiceAPI::DocumentDirection::TaggedSymbol)
      OUTBOUND = T.let(:OUTBOUND, EInvoiceAPI::DocumentDirection::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoiceAPI::DocumentDirection::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
