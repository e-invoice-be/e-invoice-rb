# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Stats#retrieve
    class StatsRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute aggregation
      #   Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      #
      #   @return [Symbol, EInvoiceAPI::Models::StatsRetrieveParams::Aggregation, nil]
      optional :aggregation, enum: -> { EInvoiceAPI::StatsRetrieveParams::Aggregation }, nil?: true

      # @!attribute end_date
      #   End date in yyyy-mm-dd format. If not provided, queries to latest available
      #   data.
      #
      #   @return [Date, nil]
      optional :end_date, Date, nil?: true

      # @!attribute start_date
      #   Start date in yyyy-mm-dd format. If not provided, queries from earliest
      #   available data.
      #
      #   @return [Date, nil]
      optional :start_date, Date, nil?: true

      # @!method initialize(aggregation: nil, end_date: nil, start_date: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::StatsRetrieveParams} for more details.
      #
      #   @param aggregation [Symbol, EInvoiceAPI::Models::StatsRetrieveParams::Aggregation, nil] Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      #
      #   @param end_date [Date, nil] End date in yyyy-mm-dd format. If not provided, queries to latest available data
      #
      #   @param start_date [Date, nil] Start date in yyyy-mm-dd format. If not provided, queries from earliest availabl
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]

      # Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      module Aggregation
        extend EInvoiceAPI::Internal::Type::Enum

        DAY = :DAY
        WEEK = :WEEK
        MONTH = :MONTH

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
