# typed: strong

module EInvoiceAPI
  module Models
    class InboundEmailResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::InboundEmailResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :message_id

      sig { returns(String) }
      attr_accessor :sender_email

      sig { returns(T.nilable(Integer)) }
      attr_reader :attachment_count

      sig { params(attachment_count: Integer).void }
      attr_writer :attachment_count

      sig do
        returns(
          T.nilable(T::Array[EInvoiceAPI::InboundEmailResponse::Attachment])
        )
      end
      attr_reader :attachments

      sig do
        params(
          attachments:
            T::Array[EInvoiceAPI::InboundEmailResponse::Attachment::OrHash]
        ).void
      end
      attr_writer :attachments

      sig { returns(T.nilable(String)) }
      attr_accessor :bcc_addresses

      sig { returns(T.nilable(String)) }
      attr_accessor :cc_addresses

      sig { returns(T.nilable(String)) }
      attr_accessor :document_id

      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :processed

      sig { params(processed: T::Boolean).void }
      attr_writer :processed

      sig { returns(T.nilable(Time)) }
      attr_accessor :processed_at

      sig { returns(T.nilable(Time)) }
      attr_accessor :received_at

      sig { returns(T.nilable(String)) }
      attr_accessor :sender_name

      sig { returns(T.nilable(String)) }
      attr_accessor :subject

      sig { returns(T.nilable(String)) }
      attr_accessor :to_addresses

      sig do
        params(
          id: String,
          created_at: Time,
          message_id: String,
          sender_email: String,
          attachment_count: Integer,
          attachments:
            T::Array[EInvoiceAPI::InboundEmailResponse::Attachment::OrHash],
          bcc_addresses: T.nilable(String),
          cc_addresses: T.nilable(String),
          document_id: T.nilable(String),
          error_message: T.nilable(String),
          processed: T::Boolean,
          processed_at: T.nilable(Time),
          received_at: T.nilable(Time),
          sender_name: T.nilable(String),
          subject: T.nilable(String),
          to_addresses: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        message_id:,
        sender_email:,
        attachment_count: nil,
        attachments: nil,
        bcc_addresses: nil,
        cc_addresses: nil,
        document_id: nil,
        error_message: nil,
        processed: nil,
        processed_at: nil,
        received_at: nil,
        sender_name: nil,
        subject: nil,
        to_addresses: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            message_id: String,
            sender_email: String,
            attachment_count: Integer,
            attachments:
              T::Array[EInvoiceAPI::InboundEmailResponse::Attachment],
            bcc_addresses: T.nilable(String),
            cc_addresses: T.nilable(String),
            document_id: T.nilable(String),
            error_message: T.nilable(String),
            processed: T::Boolean,
            processed_at: T.nilable(Time),
            received_at: T.nilable(Time),
            sender_name: T.nilable(String),
            subject: T.nilable(String),
            to_addresses: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Attachment < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::InboundEmailResponse::Attachment,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :filename

        sig { returns(T.nilable(String)) }
        attr_accessor :content_type

        sig { returns(T.nilable(Integer)) }
        attr_accessor :size

        sig do
          params(
            filename: String,
            content_type: T.nilable(String),
            size: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(filename:, content_type: nil, size: nil)
        end

        sig do
          override.returns(
            {
              filename: String,
              content_type: T.nilable(String),
              size: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
