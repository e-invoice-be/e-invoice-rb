# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#create
    class WebhookResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute events
      #
      #   @return [Array<String>]
      required :events, EInvoiceAPI::Internal::Type::ArrayOf[String]

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
      optional :enabled, EInvoiceAPI::Internal::Type::Boolean

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
