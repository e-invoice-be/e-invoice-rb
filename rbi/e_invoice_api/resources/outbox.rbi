# typed: strong

module EInvoiceAPI
  module Resources
    class Outbox
      # Retrieve a paginated list of draft documents with filtering options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
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
          search: T.nilable(String),
          sender: T.nilable(String),
          state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
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
        # Search in invoice number, seller/buyer names
        search: nil,
        # Filter by sender ID
        sender: nil,
        # Filter by document state
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
