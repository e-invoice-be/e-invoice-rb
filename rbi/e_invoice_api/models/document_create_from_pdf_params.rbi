# typed: strong

module EInvoiceAPI
  module Models
    class DocumentCreateFromPdfParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::DocumentCreateFromPdfParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(EInvoiceAPI::Internal::FileInput) }
      attr_accessor :file

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_tax_id

      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_tax_id

      sig do
        params(
          file: EInvoiceAPI::Internal::FileInput,
          customer_tax_id: T.nilable(String),
          vendor_tax_id: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        file:,
        customer_tax_id: nil,
        vendor_tax_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: EInvoiceAPI::Internal::FileInput,
            customer_tax_id: T.nilable(String),
            vendor_tax_id: T.nilable(String),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
