# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @see EInvoice::Resources::Documents::Attachments#retrieve
      class AttachmentRetrieveParams < EInvoice::Internal::Type::BaseModel
        extend EInvoice::Internal::Type::RequestParameters::Converter
        include EInvoice::Internal::Type::RequestParameters

        # @!attribute document_id
        #
        #   @return [String]
        required :document_id, String

        # @!method initialize(document_id:, request_options: {})
        #   @param document_id [String]
        #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
