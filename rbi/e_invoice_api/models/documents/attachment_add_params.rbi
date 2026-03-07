# typed: strong

module EInvoiceAPI
  module Models
    module Documents
      class AttachmentAddParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Documents::AttachmentAddParams,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :document_id

        sig { returns(EInvoiceAPI::Internal::FileInput) }
        attr_accessor :file

        sig do
          params(
            document_id: String,
            file: EInvoiceAPI::Internal::FileInput,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(document_id:, file:, request_options: {})
        end

        sig do
          override.returns(
            {
              document_id: String,
              file: EInvoiceAPI::Internal::FileInput,
              request_options: EInvoiceAPI::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
