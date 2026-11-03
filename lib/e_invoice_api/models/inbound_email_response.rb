# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Mailbox#retrieve
    class InboundEmailResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute message_id
      #
      #   @return [String]
      required :message_id, String

      # @!attribute sender_email
      #
      #   @return [String]
      required :sender_email, String

      # @!attribute attachment_count
      #
      #   @return [Integer, nil]
      optional :attachment_count, Integer

      # @!attribute attachments
      #
      #   @return [Array<EInvoiceAPI::Models::InboundEmailResponse::Attachment>, nil]
      optional :attachments,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::InboundEmailResponse::Attachment] }

      # @!attribute bcc_addresses
      #
      #   @return [String, nil]
      optional :bcc_addresses, String, nil?: true

      # @!attribute cc_addresses
      #
      #   @return [String, nil]
      optional :cc_addresses, String, nil?: true

      # @!attribute document_id
      #
      #   @return [String, nil]
      optional :document_id, String, nil?: true

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!attribute processed
      #
      #   @return [Boolean, nil]
      optional :processed, EInvoiceAPI::Internal::Type::Boolean

      # @!attribute processed_at
      #
      #   @return [Time, nil]
      optional :processed_at, Time, nil?: true

      # @!attribute received_at
      #
      #   @return [Time, nil]
      optional :received_at, Time, nil?: true

      # @!attribute sender_name
      #
      #   @return [String, nil]
      optional :sender_name, String, nil?: true

      # @!attribute subject
      #
      #   @return [String, nil]
      optional :subject, String, nil?: true

      # @!attribute to_addresses
      #
      #   @return [String, nil]
      optional :to_addresses, String, nil?: true

      # @!method initialize(id:, created_at:, message_id:, sender_email:, attachment_count: nil, attachments: nil, bcc_addresses: nil, cc_addresses: nil, document_id: nil, error_message: nil, processed: nil, processed_at: nil, received_at: nil, sender_name: nil, subject: nil, to_addresses: nil)
      #   @param id [String]
      #   @param created_at [Time]
      #   @param message_id [String]
      #   @param sender_email [String]
      #   @param attachment_count [Integer]
      #   @param attachments [Array<EInvoiceAPI::Models::InboundEmailResponse::Attachment>]
      #   @param bcc_addresses [String, nil]
      #   @param cc_addresses [String, nil]
      #   @param document_id [String, nil]
      #   @param error_message [String, nil]
      #   @param processed [Boolean]
      #   @param processed_at [Time, nil]
      #   @param received_at [Time, nil]
      #   @param sender_name [String, nil]
      #   @param subject [String, nil]
      #   @param to_addresses [String, nil]

      class Attachment < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute filename
        #
        #   @return [String]
        required :filename, String

        # @!attribute content_type
        #
        #   @return [String, nil]
        optional :content_type, String, nil?: true

        # @!attribute size
        #
        #   @return [Integer, nil]
        optional :size, Integer, nil?: true

        # @!method initialize(filename:, content_type: nil, size: nil)
        #   @param filename [String]
        #   @param content_type [String, nil]
        #   @param size [Integer, nil]
      end
    end
  end
end
