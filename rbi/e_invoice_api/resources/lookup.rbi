# typed: strong

module EInvoiceAPI
  module Resources
    class Lookup
      # Lookup Peppol ID. The peppol_id must be in the form of `<scheme>:<id>`. The
      # scheme is a 4-digit code representing the identifier scheme, and the id is the
      # actual identifier value. For example, for a Belgian company it is
      # `0208:0123456789` (where 0208 is the scheme for Belgian enterprises, followed by
      # the 10 digits of the official BTW / KBO number).
      sig do
        params(
          peppol_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::LookupRetrieveResponse)
      end
      def retrieve(
        # Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
        # Belgian company.
        peppol_id:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
