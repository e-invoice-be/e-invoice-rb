# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#delete
    class DocumentDeleteResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute is_deleted
      #
      #   @return [Boolean]
      required :is_deleted, EInvoiceAPI::Internal::Type::Boolean

      # @!method initialize(is_deleted:)
      #   @param is_deleted [Boolean]
    end
  end
end
