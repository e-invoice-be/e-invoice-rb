# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @see EInvoiceAPI::Resources::Documents::Attachments#delete
      class AttachmentDeleteResponse < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute is_deleted
        #
        #   @return [Boolean]
        required :is_deleted, EInvoiceAPI::Internal::Type::Boolean

        # @!method initialize(is_deleted:)
        #   @param is_deleted [Boolean]
      end
    end
  end
end
