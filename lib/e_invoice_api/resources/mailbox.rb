# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Mailbox
      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::MailboxListParams} for more details.
      #
      # Retrieve a paginated list of received inbound emails with filtering, search, and
      # sorting options.
      #
      # @overload list(page: nil, page_size: nil, processed: nil, received_from: nil, received_to: nil, search: nil, sort_by: nil, sort_order: nil, status: nil, request_options: {})
      #
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param processed [Boolean, nil] Filter by processing status. If not provided, returns all. Ignored when `status`
      #
      #   @param received_from [Time, nil] Inclusive lower bound on received date (falls back to created_at when received_a
      #
      #   @param received_to [Time, nil] Inclusive upper bound on received date (falls back to created_at when received_a
      #
      #   @param search [String, nil] Case-insensitive search across sender email, subject, message ID, and attachment
      #
      #   @param sort_by [Symbol, EInvoiceAPI::Models::MailboxListParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, EInvoiceAPI::Models::MailboxListParams::SortOrder] Sort direction (asc/desc)
      #
      #   @param status [Symbol, EInvoiceAPI::Models::MailboxListParams::Status, nil] Filter by status: pending, success, or failed. Takes precedence over `processed`
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::InboundEmailResponse>]
      #
      # @see EInvoiceAPI::Models::MailboxListParams
      def list(params = {})
        parsed, options = EInvoiceAPI::MailboxListParams.dump_request(params)
        query = EInvoiceAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/mailbox/",
          query: query,
          page: EInvoiceAPI::Internal::DocumentsNumberPage,
          model: EInvoiceAPI::InboundEmailResponse,
          options: options
        )
      end

      # Retrieve a single inbound email by ID, scoped to the caller's tenant.
      #
      # @overload retrieve(inbound_email_id, request_options: {})
      #
      #   @param inbound_email_id [String]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::InboundEmailResponse]
      #
      # @see EInvoiceAPI::Models::MailboxRetrieveParams
      def retrieve(inbound_email_id, params = {})
        @client.request(
          method: :get,
          path: ["api/mailbox/%1$s", inbound_email_id],
          model: EInvoiceAPI::InboundEmailResponse,
          options: params[:request_options]
        )
      end

      # Download a specific attachment from an inbound email by filename. Returns the
      # binary content with the correct Content-Type.
      #
      # @overload download_attachment(filename, inbound_email_id:, request_options: {})
      #
      #   @param filename [String]
      #   @param inbound_email_id [String]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see EInvoiceAPI::Models::MailboxDownloadAttachmentParams
      def download_attachment(filename, params)
        parsed, options = EInvoiceAPI::MailboxDownloadAttachmentParams.dump_request(params)
        inbound_email_id =
          parsed.delete(:inbound_email_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["api/mailbox/%1$s/attachments/%2$s", inbound_email_id, filename],
          model: EInvoiceAPI::Internal::Type::Unknown,
          options: options
        )
      end

      # Retry processing of a previously failed inbound email by replaying the original
      # Postmark payload.
      #
      # @overload reprocess(inbound_email_id, request_options: {})
      #
      #   @param inbound_email_id [String]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::InboundEmailResponse]
      #
      # @see EInvoiceAPI::Models::MailboxReprocessParams
      def reprocess(inbound_email_id, params = {})
        @client.request(
          method: :post,
          path: ["api/mailbox/%1$s/reprocess", inbound_email_id],
          model: EInvoiceAPI::InboundEmailResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [EInvoiceAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
