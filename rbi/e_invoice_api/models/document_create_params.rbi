# typed: strong

module EInvoiceAPI
  module Models
    class DocumentCreateParams < EInvoiceAPI::Models::DocumentCreate
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::DocumentCreateParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # If true, generate a constructed PDF from the document and include it both as
      # document attachment and embedded in the UBL.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :construct_pdf

      sig { params(construct_pdf: T::Boolean).void }
      attr_writer :construct_pdf

      sig do
        params(
          construct_pdf: T::Boolean,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # If true, generate a constructed PDF from the document and include it both as
        # document attachment and embedded in the UBL.
        construct_pdf: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            construct_pdf: T::Boolean,
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
