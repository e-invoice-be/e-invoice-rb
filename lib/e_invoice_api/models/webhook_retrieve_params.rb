# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Webhooks#retrieve
    class WebhookRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
