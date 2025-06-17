# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @see EInvoiceAPI::Resources::Documents::Attachments#add
      class AttachmentAddParams < EInvoiceAPI::Internal::Type::BaseModel
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
