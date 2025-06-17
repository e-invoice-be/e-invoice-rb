# typed: strong

module EInvoiceAPI
  module Models
    class WebhookCreateParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::WebhookCreateParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T::Array[String]) }
      attr_accessor :events

      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig do
        params(
          events: T::Array[String],
          url: String,
          enabled: T::Boolean,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(events:, url:, enabled: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            events: T::Array[String],
            url: String,
            enabled: T::Boolean,
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
