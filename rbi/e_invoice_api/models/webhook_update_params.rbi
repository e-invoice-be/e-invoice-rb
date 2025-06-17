# typed: strong

module EInvoiceAPI
  module Models
    class WebhookUpdateParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::WebhookUpdateParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :enabled

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :events

      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig do
        params(
          enabled: T.nilable(T::Boolean),
          events: T.nilable(T::Array[String]),
          url: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(enabled: nil, events: nil, url: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            enabled: T.nilable(T::Boolean),
            events: T.nilable(T::Array[String]),
            url: T.nilable(String),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
