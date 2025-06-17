# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @see EInvoice::Resources::Documents::Attachments#delete
      class AttachmentDeleteResponse < EInvoice::Internal::Type::BaseModel
        # @!attribute is_deleted
        #
        #   @return [Boolean]
        required :is_deleted, EInvoice::Internal::Type::Boolean

        # @!method initialize(is_deleted:)
        #   @param is_deleted [Boolean]
      end
    end
  end
end
