# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Mailbox#reprocess
    class MailboxReprocessParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute inbound_email_id
      #
      #   @return [String]
      required :inbound_email_id, String

      # @!method initialize(inbound_email_id:, request_options: {})
      #   @param inbound_email_id [String]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
