# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Documents
      # @type [EInvoiceAPI::Internal::Type::Converter]
      AttachmentListResponse =
        EInvoiceAPI::Internal::Type::ArrayOf[-> { EInvoiceAPI::Documents::DocumentAttachment }]
    end
  end
end
