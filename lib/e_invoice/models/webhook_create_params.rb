# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Webhooks#create
    class WebhookCreateParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      # @!attribute events
      #
      #   @return [Array<String>]
      required :events, EInvoice::Internal::Type::ArrayOf[String]

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, EInvoice::Internal::Type::Boolean

      # @!method initialize(events:, url:, enabled: nil, request_options: {})
      #   @param events [Array<String>]
      #   @param url [String]
      #   @param enabled [Boolean]
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
