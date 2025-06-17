# typed: strong

module EInvoice
  module Models
    WebhookListResponse =
      T.let(
        EInvoice::Internal::Type::ArrayOf[EInvoice::WebhookResponse],
        EInvoice::Internal::Type::Converter
      )
  end
end
