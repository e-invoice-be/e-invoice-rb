# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Stats#retrieve
    class StatsRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute actions
      #   List of action statistics, one entry per aggregation period per action
      #
      #   @return [Array<EInvoiceAPI::Models::StatsRetrieveResponse::Action>]
      required :actions,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::StatsRetrieveResponse::Action] }

      # @!attribute aggregation
      #   Aggregation type used
      #
      #   @return [Symbol, EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation]
      required :aggregation, enum: -> { EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation }

      # @!attribute average_daily_usage
      #   Average daily usage (total actions / total days)
      #
      #   @return [Float]
      required :average_daily_usage, Float

      # @!attribute period_end
      #   End date of the period
      #
      #   @return [Date]
      required :period_end, Date

      # @!attribute period_start
      #   Start date of the period
      #
      #   @return [Date]
      required :period_start, Date

      # @!attribute tenant_id
      #   Tenant ID
      #
      #   @return [String]
      required :tenant_id, String

      # @!attribute total_days
      #   Number of days in the period
      #
      #   @return [Integer]
      required :total_days, Integer

      # @!attribute budget_estimation_days
      #   Estimated days until credits run out (credit_balance / average_daily_usage). 0.0
      #   if average_daily_usage is 0 or credit_balance is None
      #
      #   @return [Float, nil]
      optional :budget_estimation_days, Float

      # @!method initialize(actions:, aggregation:, average_daily_usage:, period_end:, period_start:, tenant_id:, total_days:, budget_estimation_days: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::StatsRetrieveResponse} for more details.
      #
      #   Statistics response for a tenant.
      #
      #   @param actions [Array<EInvoiceAPI::Models::StatsRetrieveResponse::Action>] List of action statistics, one entry per aggregation period per action
      #
      #   @param aggregation [Symbol, EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation] Aggregation type used
      #
      #   @param average_daily_usage [Float] Average daily usage (total actions / total days)
      #
      #   @param period_end [Date] End date of the period
      #
      #   @param period_start [Date] Start date of the period
      #
      #   @param tenant_id [String] Tenant ID
      #
      #   @param total_days [Integer] Number of days in the period
      #
      #   @param budget_estimation_days [Float] Estimated days until credits run out (credit_balance / average_daily_usage). 0.0

      class Action < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute action
        #   Type of action
        #
        #   @return [Symbol, EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action]
        required :action, enum: -> { EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action }

        # @!attribute count
        #   Number of occurrences of this action in this period
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute stat_date
        #   The date/period this stat represents. For DAY aggregation this is the specific
        #   day, for WEEK it's the start of the week, for MONTH it's the first day of the
        #   month
        #
        #   @return [Date]
        required :stat_date, Date

        # @!method initialize(action:, count:, stat_date:)
        #   Some parameter documentations has been truncated, see
        #   {EInvoiceAPI::Models::StatsRetrieveResponse::Action} for more details.
        #
        #   Statistics for a specific action in a specific time period.
        #
        #   @param action [Symbol, EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action] Type of action
        #
        #   @param count [Integer] Number of occurrences of this action in this period
        #
        #   @param stat_date [Date] The date/period this stat represents. For DAY aggregation this is the specific d

        # Type of action
        #
        # @see EInvoiceAPI::Models::StatsRetrieveResponse::Action#action
        module Action
          extend EInvoiceAPI::Internal::Type::Enum

          DOCUMENT_SENT = :DOCUMENT_SENT
          DOCUMENT_RECEIVED = :DOCUMENT_RECEIVED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Aggregation type used
      #
      # @see EInvoiceAPI::Models::StatsRetrieveResponse#aggregation
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
