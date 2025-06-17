# typed: strong

module EInvoiceAPI
  module Models
    module Documents
      class AttachmentRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Documents::AttachmentRetrieveParams,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :document_id

        sig do
          params(
            document_id: String,
            request_options: EInvoiceAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(document_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              document_id: String,
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
