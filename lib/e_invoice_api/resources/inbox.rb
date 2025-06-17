# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Inbox
      # Retrieve a paginated list of received documents with filtering options.
      #
      # @overload list(date_from: nil, date_to: nil, page: nil, page_size: nil, search: nil, sender: nil, state: nil, type: nil, request_options: {})
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
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState, nil] Filter by document state
      #
      # @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::InboxListParams
      def list(params = {})
        parsed, options = EInvoiceAPI::InboxListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/inbox/",
          query: parsed,
          page: EInvoiceAPI::Internal::DocumentsNumberPage,
          model: EInvoiceAPI::DocumentResponse,
          options: options
        )
      end

      # Retrieve a paginated list of received credit notes with filtering options.
      #
      # @overload list_credit_notes(page: nil, page_size: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::InboxListCreditNotesParams
      def list_credit_notes(params = {})
        parsed, options = EInvoiceAPI::InboxListCreditNotesParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/inbox/credit-notes",
          query: parsed,
          page: EInvoiceAPI::Internal::DocumentsNumberPage,
          model: EInvoiceAPI::DocumentResponse,
          options: options
        )
      end

      # Retrieve a paginated list of received invoices with filtering options.
      #
      # @overload list_invoices(page: nil, page_size: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::InboxListInvoicesParams
      def list_invoices(params = {})
        parsed, options = EInvoiceAPI::InboxListInvoicesParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/inbox/invoices",
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
