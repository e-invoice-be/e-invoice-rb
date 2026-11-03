# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#test_
    class WebhookTestParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute webhook_id
      #
      #   @return [String]
      required :webhook_id, String

      # @!attribute data
      #   Custom event data payload
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown]

      # @!attribute event_type
      #   Must be valid WebhookEventType
      #
      #   @return [String]
      required :event_type, String

      # @!method initialize(webhook_id:, data:, event_type:, request_options: {})
      #   @param webhook_id [String]
      #
      #   @param data [Hash{Symbol=>Object}] Custom event data payload
      #
      #   @param event_type [String] Must be valid WebhookEventType
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
