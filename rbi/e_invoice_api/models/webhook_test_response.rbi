# typed: strong

module EInvoiceAPI
  module Models
    class WebhookTestResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::WebhookTestResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Descriptive message about the test result
      sig { returns(String) }
      attr_accessor :message

      # Whether the test completed successfully
      sig { returns(T::Boolean) }
      attr_accessor :success

      # Result from process_webhook_task
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :webhook_delivery_result

      # Schema for webhook test response.
      sig do
        params(
          message: String,
          success: T::Boolean,
          webhook_delivery_result: T::Hash[Symbol, T.anything]
        ).returns(T.attached_class)
      end
      def self.new(
        # Descriptive message about the test result
        message:,
        # Whether the test completed successfully
        success:,
        # Result from process_webhook_task
        webhook_delivery_result:
      )
      end

      sig do
        override.returns(
          {
            message: String,
            success: T::Boolean,
            webhook_delivery_result: T::Hash[Symbol, T.anything]
          }
        )
      end
      def to_hash
      end
    end
  end
end
