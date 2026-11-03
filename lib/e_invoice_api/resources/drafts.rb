# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Drafts
      # Retrieve a paginated list of draft documents with filtering options including
      # state and text search.
      #
      # @overload list(date_from: nil, date_to: nil, page: nil, page_size: nil, search: nil, sort_by: nil, sort_order: nil, state: nil, type: nil, request_options: {})
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
      # @param sort_by [Symbol, EInvoiceAPI::Models::DraftListParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, EInvoiceAPI::Models::DraftListParams::SortOrder] Sort direction (asc/desc)
      #
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState, nil] Filter by document state. By default return all states (DRAFT, TRANSIT, FAILED).
      #
      # @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Internal::DocumentsNumberPage<EInvoiceAPI::Models::DocumentResponse>]
      #
      # @see EInvoiceAPI::Models::DraftListParams
      def list(params = {})
        parsed, options = EInvoiceAPI::DraftListParams.dump_request(params)
        query = EInvoiceAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/drafts/",
          query: query,
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
