# frozen_string_literal: true

module EInvoice
  module Models
    module DocumentState
      extend EInvoice::Internal::Type::Enum

      DRAFT = :DRAFT
      TRANSIT = :TRANSIT
      FAILED = :FAILED
      SENT = :SENT
      RECEIVED = :RECEIVED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
