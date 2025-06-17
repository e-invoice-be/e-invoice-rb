# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#create
    class WebhookCreateParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute events
      #
      #   @return [Array<String>]
      required :events, EInvoiceAPI::Internal::Type::ArrayOf[String]

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, EInvoiceAPI::Internal::Type::Boolean

      # @!method initialize(events:, url:, enabled: nil, request_options: {})
      #   @param events [Array<String>]
      #   @param url [String]
      #   @param enabled [Boolean]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
