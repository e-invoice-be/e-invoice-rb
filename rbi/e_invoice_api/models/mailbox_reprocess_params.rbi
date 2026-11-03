# typed: strong

module EInvoiceAPI
  module Models
    class MailboxReprocessParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::MailboxReprocessParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :inbound_email_id

      sig do
        params(
          inbound_email_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(inbound_email_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            inbound_email_id: String,
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
