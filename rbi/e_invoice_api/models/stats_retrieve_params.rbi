# typed: strong

module EInvoiceAPI
  module Models
    class StatsRetrieveParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::StatsRetrieveParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      sig do
        returns(
          T.nilable(EInvoiceAPI::StatsRetrieveParams::Aggregation::OrSymbol)
        )
      end
      attr_accessor :aggregation

      # End date in yyyy-mm-dd format. If not provided, queries to latest available
      # data.
      sig { returns(T.nilable(Date)) }
      attr_accessor :end_date

      # Start date in yyyy-mm-dd format. If not provided, queries from earliest
      # available data.
      sig { returns(T.nilable(Date)) }
      attr_accessor :start_date

      sig do
        params(
          aggregation:
            T.nilable(EInvoiceAPI::StatsRetrieveParams::Aggregation::OrSymbol),
          end_date: T.nilable(Date),
          start_date: T.nilable(Date),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            aggregation:
              T.nilable(
                EInvoiceAPI::StatsRetrieveParams::Aggregation::OrSymbol
              ),
            end_date: T.nilable(Date),
            start_date: T.nilable(Date),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Aggregation type: DAY, WEEK, or MONTH. Defaults to DAY.
      module Aggregation
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, EInvoiceAPI::StatsRetrieveParams::Aggregation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DAY =
          T.let(
            :DAY,
            EInvoiceAPI::StatsRetrieveParams::Aggregation::TaggedSymbol
          )
        WEEK =
          T.let(
            :WEEK,
            EInvoiceAPI::StatsRetrieveParams::Aggregation::TaggedSymbol
          )
        MONTH =
          T.let(
            :MONTH,
            EInvoiceAPI::StatsRetrieveParams::Aggregation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::StatsRetrieveParams::Aggregation::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
