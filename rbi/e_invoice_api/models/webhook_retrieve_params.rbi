# typed: strong

module EInvoiceAPI
  module Models
    class WebhookRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::WebhookRetrieveParams,
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

      sig { override.returns({ request_options: EInvoiceAPI::RequestOptions }) }
      def to_hash
      end
    end
  end
end
