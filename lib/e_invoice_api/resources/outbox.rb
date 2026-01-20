# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Outbox
      # Retrieve a paginated list of draft documents with filtering options including
      # state and text search.
      #
      # @overload list_draft_documents(page: nil, page_size: nil, search: nil, sort_by: nil, sort_order: nil, state: nil, type: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param search [String, nil] Search in invoice number, seller/buyer names
      #
      # @param sort_by [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortOrder] Sort direction (asc/desc)
      #
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState, nil] Filter by document state
      #
      # @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::OutboxListDraftDocumentsParams
      def list_draft_documents(params = {})
        parsed, options = EInvoiceAPI::OutboxListDraftDocumentsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/outbox/drafts",
          query: parsed,
          page: EInvoiceAPI::Internal::DocumentsNumberPage,
          model: EInvoiceAPI::DocumentResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::OutboxListReceivedDocumentsParams} for more details.
      #
      # Retrieve a paginated list of sent documents with filtering options including
      # state, type, sender, date range, and text search.
      #
      # @overload list_received_documents(date_from: nil, date_to: nil, page: nil, page_size: nil, receiver: nil, search: nil, sender: nil, sort_by: nil, sort_order: nil, type: nil, request_options: {})
      #
      # @param date_from [Time, nil] Filter by issue date (from)
      #
      # @param date_to [Time, nil] Filter by issue date (to)
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param receiver [String, nil] Filter by receiver (customer_name, customer_email, customer_tax_id, customer_com
      #
      # @param search [String, nil] Search in invoice number, seller/buyer names
      #
      # @param sender [String, nil] (Deprecated) Filter by sender ID
      #
      # @param sort_by [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortOrder] Sort direction (asc/desc)
      #
      # @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type. If not provided, returns all types.
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::OutboxListReceivedDocumentsParams
      def list_received_documents(params = {})
        parsed, options = EInvoiceAPI::OutboxListReceivedDocumentsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/outbox/",
          query: parsed,
          page: EInvoiceAPI::Internal::DocumentsNumberPage,
          model: EInvoiceAPI::DocumentResponse,
          options: options
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
