# typed: strong

module EInvoiceAPI
  module Resources
    class Conversion
      class Pdf
        # Convert a PDF to a document
        sig do
          params(
            file: EInvoiceAPI::Internal::FileInput,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(EInvoiceAPI::Conversion::DocumentCreateFromPdfTask)
        end
        def create(file:, request_options: {})
        end

        # Get the status of a PDF conversion task
        sig do
          params(
            task_id: String,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(EInvoiceAPI::Conversion::DocumentCreateFromPdfTask)
        end
        def retrieve(task_id, request_options: {})
        end

        # Get the result of a PDF conversion task
        sig do
          params(
            task_id: String,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(EInvoiceAPI::Models::DocumentCreateFromPdfResponse)
        end
        def result(task_id, request_options: {})
        end

        # @api private
        sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
