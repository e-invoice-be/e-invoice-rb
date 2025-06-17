# frozen_string_literal: true

module EInvoice
  module Resources
    class Outbox
      # Retrieve a paginated list of draft documents with filtering options.
      #
      # @overload list_draft_documents(page: nil, page_size: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoice::Internal::DocumentsNumberPage<EInvoice::Models::DocumentResponse>]
      #
      # @see EInvoice::Models::OutboxListDraftDocumentsParams
      def list_draft_documents(params = {})
        parsed, options = EInvoice::OutboxListDraftDocumentsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/outbox/drafts",
          query: parsed,
          page: EInvoice::Internal::DocumentsNumberPage,
          model: EInvoice::DocumentResponse,
          options: options
        )
      end

      # Retrieve a paginated list of received documents with filtering options.
      #
      # @overload list_received_documents(date_from: nil, date_to: nil, page: nil, page_size: nil, search: nil, sender: nil, state: nil, type: nil, request_options: {})
      #
      # @param date_from [Time, nil] Filter by issue date (from)
      #
      # @param date_to [Time, nil] Filter by issue date (to)
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param search [String, nil] Search in invoice number, seller/buyer names
      #
      # @param sender [String, nil] Filter by sender ID
      #
      # @param state [Symbol, EInvoice::Models::DocumentState, nil] Filter by document state
      #
      # @param type [Symbol, EInvoice::Models::DocumentType, nil] Filter by document type
      #
      # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoice::Internal::DocumentsNumberPage<EInvoice::Models::DocumentResponse>]
      #
      # @see EInvoice::Models::OutboxListReceivedDocumentsParams
      def list_received_documents(params = {})
        parsed, options = EInvoice::OutboxListReceivedDocumentsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/outbox/",
          query: parsed,
          page: EInvoice::Internal::DocumentsNumberPage,
          model: EInvoice::DocumentResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [EInvoice::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
