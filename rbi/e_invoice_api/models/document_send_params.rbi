# typed: strong

module EInvoiceAPI
  module Models
    class DocumentSendParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::DocumentSendParams, EInvoiceAPI::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      sig { returns(T.nilable(String)) }
      attr_accessor :receiver_peppol_id

      sig { returns(T.nilable(String)) }
      attr_accessor :receiver_peppol_scheme

      sig { returns(T.nilable(String)) }
      attr_accessor :sender_peppol_id

      sig { returns(T.nilable(String)) }
      attr_accessor :sender_peppol_scheme

      sig do
        params(
          email: T.nilable(String),
          receiver_peppol_id: T.nilable(String),
          receiver_peppol_scheme: T.nilable(String),
          sender_peppol_id: T.nilable(String),
          sender_peppol_scheme: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        email: nil,
        receiver_peppol_id: nil,
        receiver_peppol_scheme: nil,
        sender_peppol_id: nil,
        sender_peppol_scheme: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            email: T.nilable(String),
            receiver_peppol_id: T.nilable(String),
            receiver_peppol_scheme: T.nilable(String),
            sender_peppol_id: T.nilable(String),
            sender_peppol_scheme: T.nilable(String),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
