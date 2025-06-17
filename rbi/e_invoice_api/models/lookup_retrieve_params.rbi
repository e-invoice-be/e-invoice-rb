# typed: strong

module EInvoiceAPI
  module Models
    class LookupRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::LookupRetrieveParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
      # Belgian company.
      sig { returns(String) }
      attr_accessor :peppol_id

      sig do
        params(
          peppol_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
        # Belgian company.
        peppol_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { peppol_id: String, request_options: EInvoiceAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
