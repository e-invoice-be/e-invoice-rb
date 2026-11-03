# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Mailbox#download_attachment
    class MailboxDownloadAttachmentParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute inbound_email_id
      #
      #   @return [String]
      required :inbound_email_id, String

      # @!attribute filename
      #
      #   @return [String]
      required :filename, String

      # @!method initialize(inbound_email_id:, filename:, request_options: {})
      #   @param inbound_email_id [String]
      #   @param filename [String]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
