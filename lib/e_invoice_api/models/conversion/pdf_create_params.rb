# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Conversion
      # @see EInvoiceAPI::Resources::Conversion::Pdf#create
      class PdfCreateParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        # @!attribute file
        #
        #   @return [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        required :file, EInvoiceAPI::Internal::Type::FileInput

        # @!method initialize(file:, request_options: {})
        #   @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
