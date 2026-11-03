# typed: strong

module EInvoiceAPI
  module Resources
    class Drafts
      # Retrieve a paginated list of draft documents with filtering options including
      # state and text search.
      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sort_by: EInvoiceAPI::DraftListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::DraftListParams::SortOrder::OrSymbol,
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
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document state. By default return all states (DRAFT, TRANSIT, FAILED).
        state: nil,
        # Filter by document type
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
