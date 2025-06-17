# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @type [EInvoiceAPI::Internal::Type::Converter]
    WebhookListResponse = EInvoiceAPI::Internal::Type::ArrayOf[-> { EInvoiceAPI::WebhookResponse }]
  end
end
