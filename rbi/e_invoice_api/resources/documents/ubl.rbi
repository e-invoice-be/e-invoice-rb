# typed: strong

module EInvoiceAPI
  module Resources
    class Documents
      class Ubl
        # Create a new invoice or credit note from a UBL file
        sig do
          params(
            file: EInvoiceAPI::Internal::FileInput,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(EInvoiceAPI::DocumentResponse)
        end
        def create_from_ubl(file:, request_options: {})
        end

        # Get the UBL for an invoice or credit note
        sig do
          params(
            document_id: String,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(EInvoiceAPI::Models::Documents::UblGetResponse)
        end
        def get(document_id, request_options: {})
        end

        # @api private
        sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
