# typed: strong

module EInvoiceAPI
  module Resources
    class Outbox
      # Retrieve a paginated list of draft documents with filtering options including
      # state and text search.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sort_by:
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::OrSymbol,
          sort_order:
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::OrSymbol,
          state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
          type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::DocumentResponse
          ]
        )
      end
      def list_draft_documents(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Search in invoice number, seller/buyer names
        search: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document state
        state: nil,
        # Filter by document type
        type: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of sent documents with filtering options including
      # state, type, sender, date range, and text search.
      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          receiver: T.nilable(String),
          search: T.nilable(String),
          sender: T.nilable(String),
          sort_by:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::OrSymbol,
          sort_order:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::OrSymbol,
          type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::DocumentResponse
          ]
        )
      end
      def list_received_documents(
        # Filter by issue date (from)
        date_from: nil,
        # Filter by issue date (to)
        date_to: nil,
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Filter by receiver (customer_name, customer_email, customer_tax_id,
        # customer_company_id, customer_id)
        receiver: nil,
        # Search in invoice number, seller/buyer names
        search: nil,
        # (Deprecated) Filter by sender ID
        sender: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document type. If not provided, returns all types.
        type: nil,
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
