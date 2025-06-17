# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @type [EInvoice::Internal::Type::Converter]
      AttachmentListResponse =
        EInvoice::Internal::Type::ArrayOf[-> { EInvoice::Documents::DocumentAttachment }]
    end
  end
end
