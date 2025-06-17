# typed: strong

module EInvoiceAPI
  module Models
    module Documents
      AttachmentListResponse =
        T.let(
          EInvoiceAPI::Internal::Type::ArrayOf[
            EInvoiceAPI::Documents::DocumentAttachment
          ],
          EInvoiceAPI::Internal::Type::Converter
        )
    end
  end
end
