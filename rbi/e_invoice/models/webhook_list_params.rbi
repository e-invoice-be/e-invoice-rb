# typed: strong

module EInvoice
  module Models
    class WebhookListParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoice::WebhookListParams, EInvoice::Internal::AnyHash)
        end

      sig do
        params(request_options: EInvoice::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: EInvoice::RequestOptions }) }
      def to_hash
      end
    end
  end
end
