# frozen_string_literal: true

module EInvoice
  module Models
    # @type [EInvoice::Internal::Type::Converter]
    WebhookListResponse = EInvoice::Internal::Type::ArrayOf[-> { EInvoice::WebhookResponse }]
  end
end
