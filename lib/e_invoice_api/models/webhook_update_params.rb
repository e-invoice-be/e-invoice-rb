# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#update
    class WebhookUpdateParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute webhook_id
      #
      #   @return [String]
      required :webhook_id, String

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, EInvoiceAPI::Internal::Type::Boolean, nil?: true

      # @!attribute events
      #
      #   @return [Array<String>, nil]
      optional :events, EInvoiceAPI::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(webhook_id:, enabled: nil, events: nil, url: nil, request_options: {})
      #   @param webhook_id [String]
      #   @param enabled [Boolean, nil]
      #   @param events [Array<String>, nil]
      #   @param url [String, nil]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
