# typed: strong

module EInvoice
  module Models
    module Documents
      class AttachmentDeleteParams < EInvoice::Internal::Type::BaseModel
        extend EInvoice::Internal::Type::RequestParameters::Converter
        include EInvoice::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              EInvoice::Documents::AttachmentDeleteParams,
              EInvoice::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :document_id

        sig do
          params(
            document_id: String,
            request_options: EInvoice::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(document_id:, request_options: {})
        end

        sig do
          override.returns(
            { document_id: String, request_options: EInvoice::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
