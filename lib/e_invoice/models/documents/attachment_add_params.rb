# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @see EInvoice::Resources::Documents::Attachments#add
      class AttachmentAddParams < EInvoice::Internal::Type::BaseModel
        extend EInvoice::Internal::Type::RequestParameters::Converter
        include EInvoice::Internal::Type::RequestParameters

        # @!attribute file
        #
        #   @return [Pathname, StringIO, IO, String, EInvoice::FilePart]
        required :file, EInvoice::Internal::Type::FileInput

        # @!method initialize(file:, request_options: {})
        #   @param file [Pathname, StringIO, IO, String, EInvoice::FilePart]
        #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
