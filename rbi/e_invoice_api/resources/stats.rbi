# typed: strong

module EInvoiceAPI
  module Resources
    class Stats
      # Retrieve usage statistics for billing purposes. Returns statistics for document
      # sent and document received actions, grouped by aggregation period
      # (day/week/month). If no date parameters are provided, returns daily stats for
      # all available data.
      sig do
        params(
          aggregation:
            T.nilable(EInvoiceAPI::StatsRetrieveParams::Aggregation::OrSymbol),
          end_date: T.nilable(Date),
          start_date: T.nilable(Date),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::StatsRetrieveResponse)
      end
      def retrieve(
        # Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
        aggregation: nil,
        # End date in yyyy-mm-dd format. If not provided, queries to latest available
        # data.
        end_date: nil,
        # Start date in yyyy-mm-dd format. If not provided, queries from earliest
        # available data.
        start_date: nil,
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
