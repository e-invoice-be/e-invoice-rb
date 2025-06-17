# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @see EInvoiceAPI::Resources::Documents::Ubl#get
      class UblGetParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
