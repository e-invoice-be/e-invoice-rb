# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#history
    class WebhookHistoryResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute history
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :history,
               EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown]]

      # @!method initialize(history:)
      #   @param history [Array<Hash{Symbol=>Object}>]
    end
  end
end
