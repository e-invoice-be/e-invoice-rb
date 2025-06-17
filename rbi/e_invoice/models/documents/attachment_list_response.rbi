# typed: strong

module EInvoice
  module Models
    module Documents
      AttachmentListResponse =
        T.let(
          EInvoice::Internal::Type::ArrayOf[
            EInvoice::Documents::DocumentAttachment
          ],
          EInvoice::Internal::Type::Converter
        )
    end
  end
end
