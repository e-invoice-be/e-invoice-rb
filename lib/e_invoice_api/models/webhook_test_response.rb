# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#test_
    class WebhookTestResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute message
      #   Descriptive message about the test result
      #
      #   @return [String]
      required :message, String

      # @!attribute success
      #   Whether the test completed successfully
      #
      #   @return [Boolean]
      required :success, EInvoiceAPI::Internal::Type::Boolean

      # @!attribute webhook_delivery_result
      #   Result from process_webhook_task
      #
      #   @return [Hash{Symbol=>Object}]
      required :webhook_delivery_result, EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown]

      # @!method initialize(message:, success:, webhook_delivery_result:)
      #   Schema for webhook test response.
      #
      #   @param message [String] Descriptive message about the test result
      #
      #   @param success [Boolean] Whether the test completed successfully
      #
      #   @param webhook_delivery_result [Hash{Symbol=>Object}] Result from process_webhook_task
    end
  end
end
