# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module CurrencyCode
      extend EInvoiceAPI::Internal::Type::Enum

      EUR = :EUR
      USD = :USD
      GBP = :GBP
      JPY = :JPY
      CHF = :CHF
      CAD = :CAD
      AUD = :AUD
      NZD = :NZD
      CNY = :CNY
      INR = :INR
      SEK = :SEK
      NOK = :NOK
      DKK = :DKK
      SGD = :SGD
      HKD = :HKD

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
