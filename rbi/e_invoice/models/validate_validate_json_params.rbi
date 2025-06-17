# typed: strong

module EInvoice
  module Models
    class ValidateValidateJsonParams < EInvoice::Models::DocumentCreate
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoice::ValidateValidateJsonParams,
            EInvoice::Internal::AnyHash
          )
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
