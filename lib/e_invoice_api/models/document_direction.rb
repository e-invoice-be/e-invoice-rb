# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module DocumentDirection
      extend EInvoiceAPI::Internal::Type::Enum

      INBOUND = :INBOUND
      OUTBOUND = :OUTBOUND

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
