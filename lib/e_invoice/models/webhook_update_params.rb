# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Webhooks#update
    class WebhookUpdateParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, EInvoice::Internal::Type::Boolean, nil?: true

      # @!attribute events
      #
      #   @return [Array<String>, nil]
      optional :events, EInvoice::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(enabled: nil, events: nil, url: nil, request_options: {})
      #   @param enabled [Boolean, nil]
      #   @param events [Array<String>, nil]
      #   @param url [String, nil]
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
