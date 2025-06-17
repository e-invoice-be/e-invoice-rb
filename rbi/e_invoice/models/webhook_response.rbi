# typed: strong

module EInvoice
  module Models
    class WebhookResponse < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoice::WebhookResponse, EInvoice::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Array[String]) }
      attr_accessor :events

      sig { returns(String) }
      attr_accessor :secret

      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      # Response model for webhook API endpoints.
      sig do
        params(
          id: String,
          events: T::Array[String],
          secret: String,
          url: String,
          enabled: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(id:, events:, secret:, url:, enabled: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            events: T::Array[String],
            secret: String,
            url: String,
            enabled: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
