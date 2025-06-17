# typed: strong

module EInvoice
  module Models
    class WebhookUpdateParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoice::WebhookUpdateParams, EInvoice::Internal::AnyHash)
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
          request_options: EInvoice::RequestOptions::OrHash
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
            request_options: EInvoice::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
