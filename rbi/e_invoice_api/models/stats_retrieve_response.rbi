# typed: strong

module EInvoiceAPI
  module Models
    class StatsRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::StatsRetrieveResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # List of action statistics, one entry per aggregation period per action
      sig do
        returns(T::Array[EInvoiceAPI::Models::StatsRetrieveResponse::Action])
      end
      attr_accessor :actions

      # Aggregation type used
      sig do
        returns(
          EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol
        )
      end
      attr_accessor :aggregation

      # Average daily usage (total actions / total days)
      sig { returns(Float) }
      attr_accessor :average_daily_usage

      # End date of the period
      sig { returns(Date) }
      attr_accessor :period_end

      # Start date of the period
      sig { returns(Date) }
      attr_accessor :period_start

      # Tenant ID
      sig { returns(String) }
      attr_accessor :tenant_id

      # Number of days in the period
      sig { returns(Integer) }
      attr_accessor :total_days

      # Estimated days until credits run out (credit_balance / average_daily_usage). 0.0
      # if average_daily_usage is 0 or credit_balance is None
      sig { returns(T.nilable(Float)) }
      attr_reader :budget_estimation_days

      sig { params(budget_estimation_days: Float).void }
      attr_writer :budget_estimation_days

      # Statistics response for a tenant.
      sig do
        params(
          actions:
            T::Array[
              EInvoiceAPI::Models::StatsRetrieveResponse::Action::OrHash
            ],
          aggregation:
            EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::OrSymbol,
          average_daily_usage: Float,
          period_end: Date,
          period_start: Date,
          tenant_id: String,
          total_days: Integer,
          budget_estimation_days: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # List of action statistics, one entry per aggregation period per action
        actions:,
        # Aggregation type used
        aggregation:,
        # Average daily usage (total actions / total days)
        average_daily_usage:,
        # End date of the period
        period_end:,
        # Start date of the period
        period_start:,
        # Tenant ID
        tenant_id:,
        # Number of days in the period
        total_days:,
        # Estimated days until credits run out (credit_balance / average_daily_usage). 0.0
        # if average_daily_usage is 0 or credit_balance is None
        budget_estimation_days: nil
      )
      end

      sig do
        override.returns(
          {
            actions:
              T::Array[EInvoiceAPI::Models::StatsRetrieveResponse::Action],
            aggregation:
              EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol,
            average_daily_usage: Float,
            period_end: Date,
            period_start: Date,
            tenant_id: String,
            total_days: Integer,
            budget_estimation_days: Float
          }
        )
      end
      def to_hash
      end

      class Action < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::StatsRetrieveResponse::Action,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # Type of action
        sig do
          returns(
            EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::TaggedSymbol
          )
        end
        attr_accessor :action

        # Number of occurrences of this action in this period
        sig { returns(Integer) }
        attr_accessor :count

        # The date/period this stat represents. For DAY aggregation this is the specific
        # day, for WEEK it's the start of the week, for MONTH it's the first day of the
        # month
        sig { returns(Date) }
        attr_accessor :stat_date

        # Statistics for a specific action in a specific time period.
        sig do
          params(
            action:
              EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::OrSymbol,
            count: Integer,
            stat_date: Date
          ).returns(T.attached_class)
        end
        def self.new(
          # Type of action
          action:,
          # Number of occurrences of this action in this period
          count:,
          # The date/period this stat represents. For DAY aggregation this is the specific
          # day, for WEEK it's the start of the week, for MONTH it's the first day of the
          # month
          stat_date:
        )
        end

        sig do
          override.returns(
            {
              action:
                EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::TaggedSymbol,
              count: Integer,
              stat_date: Date
            }
          )
        end
        def to_hash
        end

        # Type of action
        module Action
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DOCUMENT_SENT =
            T.let(
              :DOCUMENT_SENT,
              EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::TaggedSymbol
            )
          DOCUMENT_RECEIVED =
            T.let(
              :DOCUMENT_RECEIVED,
              EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::StatsRetrieveResponse::Action::Action::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Aggregation type used
      module Aggregation
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DAY =
          T.let(
            :DAY,
            EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol
          )
        WEEK =
          T.let(
            :WEEK,
            EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol
          )
        MONTH =
          T.let(
            :MONTH,
            EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
