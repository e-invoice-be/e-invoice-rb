# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Documents#retrieve
    class DocumentRetrieveParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
