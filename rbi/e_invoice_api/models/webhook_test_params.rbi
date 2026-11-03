# typed: strong

module EInvoiceAPI
  module Models
    class WebhookTestParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::WebhookTestParams, EInvoiceAPI::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :webhook_id

      # Custom event data payload
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      # Must be valid WebhookEventType
      sig { returns(String) }
      attr_accessor :event_type

      sig do
        params(
          webhook_id: String,
          data: T::Hash[Symbol, T.anything],
          event_type: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        webhook_id:,
        # Custom event data payload
        data:,
        # Must be valid WebhookEventType
        event_type:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            webhook_id: String,
            data: T::Hash[Symbol, T.anything],
            event_type: String,
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
