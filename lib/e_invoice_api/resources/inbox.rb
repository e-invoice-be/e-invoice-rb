# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Inbox
      # Retrieve a paginated list of received documents with filtering options including
      # state, type, sender, date range, and text search.
      #
      # @overload list(date_from: nil, date_to: nil, page: nil, page_size: nil, search: nil, sender: nil, sort_by: nil, sort_order: nil, type: nil, request_options: {})
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
      # @param sender [String, nil] Filter by sender (vendor_name, vendor_email, vendor_tax_id, vendor_company_id)
      #
      # @param sort_by [Symbol, EInvoiceAPI::Models::InboxListParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::InboxListParams::SortOrder] Sort direction (asc/desc)
      #
      # @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type. If not provided, returns all types.
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
      # @overload list_credit_notes(page: nil, page_size: nil, sort_by: nil, sort_order: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param sort_by [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortOrder] Sort direction (asc/desc)
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
      # @overload list_invoices(page: nil, page_size: nil, sort_by: nil, sort_order: nil, request_options: {})
      #
      # @param page [Integer] Page number
      #
      # @param page_size [Integer] Number of items per page
      #
      # @param sort_by [Symbol, EInvoiceAPI::Models::InboxListInvoicesParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::InboxListInvoicesParams::SortOrder] Sort direction (asc/desc)
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
