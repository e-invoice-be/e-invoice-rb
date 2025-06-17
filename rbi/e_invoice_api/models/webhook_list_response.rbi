# typed: strong

module EInvoiceAPI
  module Models
    WebhookListResponse =
      T.let(
        EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::WebhookResponse],
        EInvoiceAPI::Internal::Type::Converter
      )
  end
end
