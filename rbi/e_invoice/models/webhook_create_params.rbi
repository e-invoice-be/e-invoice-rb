# typed: strong

module EInvoice
  module Models
    class WebhookCreateParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoice::WebhookCreateParams, EInvoice::Internal::AnyHash)
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
          request_options: EInvoice::RequestOptions::OrHash
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
            request_options: EInvoice::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
