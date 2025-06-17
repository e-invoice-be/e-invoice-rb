# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Webhooks#create
    class WebhookResponse < EInvoice::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute events
      #
      #   @return [Array<String>]
      required :events, EInvoice::Internal::Type::ArrayOf[String]

      # @!attribute secret
      #
      #   @return [String]
      required :secret, String

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, EInvoice::Internal::Type::Boolean

      # @!method initialize(id:, events:, secret:, url:, enabled: nil)
      #   Response model for webhook API endpoints.
      #
      #   @param id [String]
      #   @param events [Array<String>]
      #   @param secret [String]
      #   @param url [String]
      #   @param enabled [Boolean]
    end
  end
end
