# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @see EInvoiceAPI::Resources::Documents::Attachments#add
      class AttachmentAddParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        # @!attribute document_id
        #
        #   @return [String]
        required :document_id, String

        # @!attribute file
        #
        #   @return [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        required :file, EInvoiceAPI::Internal::Type::FileInput

        # @!method initialize(document_id:, file:, request_options: {})
        #   @param document_id [String]
        #   @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
