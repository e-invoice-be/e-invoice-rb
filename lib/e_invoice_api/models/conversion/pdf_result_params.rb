# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Conversion
      # @see EInvoiceAPI::Resources::Conversion::Pdf#result
      class PdfResultParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        # @!attribute task_id
        #
        #   @return [String]
        required :task_id, String

        # @!method initialize(task_id:, request_options: {})
        #   @param task_id [String]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
