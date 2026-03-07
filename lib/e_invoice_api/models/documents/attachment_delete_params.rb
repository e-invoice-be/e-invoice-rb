# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @see EInvoiceAPI::Resources::Documents::Attachments#delete
      class AttachmentDeleteParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        # @!attribute document_id
        #
        #   @return [String]
        required :document_id, String

        # @!attribute attachment_id
        #
        #   @return [String]
        required :attachment_id, String

        # @!method initialize(document_id:, attachment_id:, request_options: {})
        #   @param document_id [String]
        #   @param attachment_id [String]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
