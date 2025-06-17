# typed: strong

module EInvoice
  module Models
    class ValidateValidateUblParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoice::ValidateValidateUblParams,
            EInvoice::Internal::AnyHash
          )
        end

      sig { returns(EInvoice::Internal::FileInput) }
      attr_accessor :file

      sig do
        params(
          file: EInvoice::Internal::FileInput,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(file:, request_options: {})
      end

      sig do
        override.returns(
          {
            file: EInvoice::Internal::FileInput,
            request_options: EInvoice::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
