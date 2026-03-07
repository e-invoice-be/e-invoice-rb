# typed: strong

module EInvoiceAPI
  module Models
    class WebhookDeleteParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::WebhookDeleteParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :webhook_id

      sig do
        params(
          webhook_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(webhook_id:, request_options: {})
      end

      sig do
        override.returns(
          { webhook_id: String, request_options: EInvoiceAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
