# frozen_string_literal: true

module EInvoice
  module Models
    module DocumentDirection
      extend EInvoice::Internal::Type::Enum

      INBOUND = :INBOUND
      OUTBOUND = :OUTBOUND

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
