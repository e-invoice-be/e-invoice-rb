# typed: strong

module EInvoiceAPI
  module Models
    module CurrencyCode
      extend EInvoiceAPI::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoiceAPI::CurrencyCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      EUR = T.let(:EUR, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      USD = T.let(:USD, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      GBP = T.let(:GBP, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      JPY = T.let(:JPY, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      CHF = T.let(:CHF, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      CAD = T.let(:CAD, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      AUD = T.let(:AUD, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      NZD = T.let(:NZD, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      CNY = T.let(:CNY, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      INR = T.let(:INR, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      SEK = T.let(:SEK, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      NOK = T.let(:NOK, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      DKK = T.let(:DKK, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      SGD = T.let(:SGD, EInvoiceAPI::CurrencyCode::TaggedSymbol)
      HKD = T.let(:HKD, EInvoiceAPI::CurrencyCode::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoiceAPI::CurrencyCode::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
