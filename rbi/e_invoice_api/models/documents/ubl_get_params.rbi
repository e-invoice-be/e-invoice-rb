# typed: strong

module EInvoiceAPI
  module Models
    module Documents
      class UblGetParams < EInvoiceAPI::Internal::Type::BaseModel
        extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
        include EInvoiceAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Documents::UblGetParams,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig do
          params(request_options: EInvoiceAPI::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: EInvoiceAPI::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
