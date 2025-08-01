# typed: strong

module EInvoiceAPI
  module Resources
    class Webhooks
      # Create a new webhook
      sig do
        params(
          events: T::Array[String],
          url: String,
          enabled: T::Boolean,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::WebhookResponse)
      end
      def create(events:, url:, enabled: nil, request_options: {})
      end

      # Get a webhook by ID
      sig do
        params(
          webhook_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::WebhookResponse)
      end
      def retrieve(webhook_id, request_options: {})
      end

      # Update a webhook by ID
      sig do
        params(
          webhook_id: String,
          enabled: T.nilable(T::Boolean),
          events: T.nilable(T::Array[String]),
          url: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::WebhookResponse)
      end
      def update(
        webhook_id,
        enabled: nil,
        events: nil,
        url: nil,
        request_options: {}
      )
      end

      # Get all webhooks for the current tenant
      sig do
        params(request_options: EInvoiceAPI::RequestOptions::OrHash).returns(
          T::Array[EInvoiceAPI::WebhookResponse]
        )
      end
      def list(request_options: {})
      end

      # Delete a webhook
      sig do
        params(
          webhook_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::WebhookDeleteResponse)
      end
      def delete(webhook_id, request_options: {})
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
