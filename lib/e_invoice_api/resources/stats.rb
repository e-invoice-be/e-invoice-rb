# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Stats
      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::StatsRetrieveParams} for more details.
      #
      # Retrieve usage statistics for billing purposes. Returns statistics for document
      # sent and document received actions, grouped by aggregation period
      # (day/week/month). If no date parameters are provided, returns daily stats for
      # all available data.
      #
      # @overload retrieve(aggregation: nil, end_date: nil, start_date: nil, request_options: {})
      #
      # @param aggregation [Symbol, EInvoiceAPI::Models::StatsRetrieveParams::Aggregation, nil] Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      #
      # @param end_date [Date, nil] End date in yyyy-mm-dd format. If not provided, queries to latest available data
      #
      # @param start_date [Date, nil] Start date in yyyy-mm-dd format. If not provided, queries from earliest availabl
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::StatsRetrieveResponse]
      #
      # @see EInvoiceAPI::Models::StatsRetrieveParams
      def retrieve(params = {})
        parsed, options = EInvoiceAPI::StatsRetrieveParams.dump_request(params)
        query = EInvoiceAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/stats",
          query: query,
          model: EInvoiceAPI::Models::StatsRetrieveResponse,
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
