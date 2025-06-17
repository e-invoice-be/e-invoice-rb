# typed: strong

module EInvoice
  module Resources
    class Inbox
      # Retrieve a paginated list of received documents with filtering options.
      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sender: T.nilable(String),
          state: T.nilable(EInvoice::DocumentState::OrSymbol),
          type: T.nilable(EInvoice::DocumentType::OrSymbol),
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(
          EInvoice::Internal::DocumentsNumberPage[EInvoice::DocumentResponse]
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
        # Filter by sender ID
        sender: nil,
        # Filter by document state
        state: nil,
        # Filter by document type
        type: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of received credit notes with filtering options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(
          EInvoice::Internal::DocumentsNumberPage[EInvoice::DocumentResponse]
        )
      end
      def list_credit_notes(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of received invoices with filtering options.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(
          EInvoice::Internal::DocumentsNumberPage[EInvoice::DocumentResponse]
        )
      end
      def list_invoices(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: EInvoice::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
