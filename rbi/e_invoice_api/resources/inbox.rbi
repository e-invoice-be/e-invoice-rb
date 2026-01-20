# typed: strong

module EInvoiceAPI
  module Resources
    class Inbox
      # Retrieve a paginated list of received documents with filtering options including
      # state, type, sender, date range, and text search.
      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sender: T.nilable(String),
          sort_by: EInvoiceAPI::InboxListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::InboxListParams::SortOrder::OrSymbol,
          state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
          type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::DocumentResponse
          ]
        )
      end
      def list(
        # Filter by issue date (from)
        date_from: nil,
        # Filter by issue date (to)
        date_to: nil,
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Search in invoice number, seller/buyer names
        search: nil,
        # Filter by sender (vendor_name, vendor_email, vendor_tax_id, vendor_company_id)
        sender: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document state. If not provided, returns all states.
        state: nil,
        # Filter by document type. If not provided, returns all types.
        type: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of received credit notes with filtering options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          sort_by: EInvoiceAPI::InboxListCreditNotesParams::SortBy::OrSymbol,
          sort_order:
            EInvoiceAPI::InboxListCreditNotesParams::SortOrder::OrSymbol,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::DocumentResponse
          ]
        )
      end
      def list_credit_notes(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of received invoices with filtering options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          sort_by: EInvoiceAPI::InboxListInvoicesParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::InboxListInvoicesParams::SortOrder::OrSymbol,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(
          EInvoiceAPI::Internal::DocumentsNumberPage[
            EInvoiceAPI::DocumentResponse
          ]
        )
      end
      def list_invoices(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
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
