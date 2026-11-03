# typed: strong

module EInvoiceAPI
  module Resources
    class Mailbox
      # Retrieve a paginated list of received inbound emails with filtering, search, and
      # sorting options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          processed: T.nilable(T::Boolean),
          received_from: T.nilable(Time),
          received_to: T.nilable(Time),
          search: T.nilable(String),
          sort_by: EInvoiceAPI::MailboxListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::MailboxListParams::SortOrder::OrSymbol,
          status: T.nilable(EInvoiceAPI::MailboxListParams::Status::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::InboundEmailResponse
          ]
        )
      end
      def list(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Filter by processing status. If not provided, returns all. Ignored when `status`
        # is set.
        processed: nil,
        # Inclusive lower bound on received date (falls back to created_at when
        # received_at is null)
        received_from: nil,
        # Inclusive upper bound on received date (falls back to created_at when
        # received_at is null)
        received_to: nil,
        # Case-insensitive search across sender email, subject, message ID, and attachment
        # filenames
        search: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by status: pending, success, or failed. Takes precedence over `processed`
        # if both are provided.
        status: nil,
        request_options: {}
      )
      end

      # Retrieve a single inbound email by ID, scoped to the caller's tenant.
      sig do
        params(
          inbound_email_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::InboundEmailResponse)
      end
      def retrieve(inbound_email_id, request_options: {})
      end

      # Download a specific attachment from an inbound email by filename. Returns the
      # binary content with the correct Content-Type.
      sig do
        params(
          filename: String,
          inbound_email_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def download_attachment(filename, inbound_email_id:, request_options: {})
      end

      # Retry processing of a previously failed inbound email by replaying the original
      # Postmark payload.
      sig do
        params(
          inbound_email_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::InboundEmailResponse)
      end
      def reprocess(inbound_email_id, request_options: {})
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
