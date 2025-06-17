# typed: strong

module EInvoice
  module Models
    module CurrencyCode
      extend EInvoice::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoice::CurrencyCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      EUR = T.let(:EUR, EInvoice::CurrencyCode::TaggedSymbol)
      USD = T.let(:USD, EInvoice::CurrencyCode::TaggedSymbol)
      GBP = T.let(:GBP, EInvoice::CurrencyCode::TaggedSymbol)
      JPY = T.let(:JPY, EInvoice::CurrencyCode::TaggedSymbol)
      CHF = T.let(:CHF, EInvoice::CurrencyCode::TaggedSymbol)
      CAD = T.let(:CAD, EInvoice::CurrencyCode::TaggedSymbol)
      AUD = T.let(:AUD, EInvoice::CurrencyCode::TaggedSymbol)
      NZD = T.let(:NZD, EInvoice::CurrencyCode::TaggedSymbol)
      CNY = T.let(:CNY, EInvoice::CurrencyCode::TaggedSymbol)
      INR = T.let(:INR, EInvoice::CurrencyCode::TaggedSymbol)
      SEK = T.let(:SEK, EInvoice::CurrencyCode::TaggedSymbol)
      NOK = T.let(:NOK, EInvoice::CurrencyCode::TaggedSymbol)
      DKK = T.let(:DKK, EInvoice::CurrencyCode::TaggedSymbol)
      SGD = T.let(:SGD, EInvoice::CurrencyCode::TaggedSymbol)
      HKD = T.let(:HKD, EInvoice::CurrencyCode::TaggedSymbol)

      sig { override.returns(T::Array[EInvoice::CurrencyCode::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
