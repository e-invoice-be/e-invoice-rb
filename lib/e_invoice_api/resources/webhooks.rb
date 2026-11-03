# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Webhooks
      # Create a new webhook
      #
      # @overload create(events:, url:, enabled: nil, request_options: {})
      #
      # @param events [Array<String>]
      # @param url [String]
      # @param enabled [Boolean]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookResponse]
      #
      # @see EInvoiceAPI::Models::WebhookCreateParams
      def create(params)
        parsed, options = EInvoiceAPI::WebhookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/webhooks/",
          body: parsed,
          model: EInvoiceAPI::WebhookResponse,
          options: options
        )
      end

      # Get a webhook by ID
      #
      # @overload retrieve(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookResponse]
      #
      # @see EInvoiceAPI::Models::WebhookRetrieveParams
      def retrieve(webhook_id, params = {})
        @client.request(
          method: :get,
          path: ["api/webhooks/%1$s", webhook_id],
          model: EInvoiceAPI::WebhookResponse,
          options: params[:request_options]
        )
      end

      # Update a webhook by ID
      #
      # @overload update(webhook_id, enabled: nil, events: nil, url: nil, request_options: {})
      #
      # @param webhook_id [String]
      # @param enabled [Boolean, nil]
      # @param events [Array<String>, nil]
      # @param url [String, nil]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookResponse]
      #
      # @see EInvoiceAPI::Models::WebhookUpdateParams
      def update(webhook_id, params = {})
        parsed, options = EInvoiceAPI::WebhookUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["api/webhooks/%1$s", webhook_id],
          body: parsed,
          model: EInvoiceAPI::WebhookResponse,
          options: options
        )
      end

      # Get all webhooks for the current tenant
      #
      # @overload list(request_options: {})
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<EInvoiceAPI::Models::WebhookResponse>]
      #
      # @see EInvoiceAPI::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "api/webhooks/",
          model: EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::WebhookResponse],
          options: params[:request_options]
        )
      end

      # Delete a webhook
      #
      # @overload delete(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookDeleteResponse]
      #
      # @see EInvoiceAPI::Models::WebhookDeleteParams
      def delete(webhook_id, params = {})
        @client.request(
          method: :delete,
          path: ["api/webhooks/%1$s", webhook_id],
          model: EInvoiceAPI::Models::WebhookDeleteResponse,
          options: params[:request_options]
        )
      end

      # Get the history of a webhook
      #
      # @overload history(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookHistoryResponse]
      #
      # @see EInvoiceAPI::Models::WebhookHistoryParams
      def history(webhook_id, params = {})
        @client.request(
          method: :get,
          path: ["api/webhooks/%1$s/history", webhook_id],
          model: EInvoiceAPI::Models::WebhookHistoryResponse,
          options: params[:request_options]
        )
      end

      # Send a test event to a webhook for testing and debugging purposes
      #
      # @overload test_(webhook_id, data:, event_type:, request_options: {})
      #
      # @param webhook_id [String]
      #
      # @param data [Hash{Symbol=>Object}] Custom event data payload
      #
      # @param event_type [String] Must be valid WebhookEventType
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::WebhookTestResponse]
      #
      # @see EInvoiceAPI::Models::WebhookTestParams
      def test_(webhook_id, params)
        parsed, options = EInvoiceAPI::WebhookTestParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/webhooks/%1$s/test", webhook_id],
          body: parsed,
          model: EInvoiceAPI::Models::WebhookTestResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [EInvoiceAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
