# typed: strong

module EInvoice
  module Models
    class Certificate < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoice::Certificate, EInvoice::Internal::AnyHash)
        end

      # Status of the certificate validation: 'success', 'error', or 'pending'
      sig { returns(String) }
      attr_accessor :status

      # Details about the certificate including subject, issuer, validity dates, etc.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :details

      # Error message if certificate validation failed
      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # Certificate information for a Peppol endpoint.
      sig do
        params(
          status: String,
          details: T.nilable(T::Hash[Symbol, T.anything]),
          error: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Status of the certificate validation: 'success', 'error', or 'pending'
        status:,
        # Details about the certificate including subject, issuer, validity dates, etc.
        details: nil,
        # Error message if certificate validation failed
        error: nil
      )
      end

      sig do
        override.returns(
          {
            status: String,
            details: T.nilable(T::Hash[Symbol, T.anything]),
            error: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
