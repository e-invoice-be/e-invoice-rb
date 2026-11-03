# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::StatsTest < EInvoiceAPI::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @e_invoice.stats.retrieve

    assert_pattern do
      response => EInvoiceAPI::Models::StatsRetrieveResponse
    end

    assert_pattern do
      response => {
        actions: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::StatsRetrieveResponse::Action]),
        aggregation: EInvoiceAPI::Models::StatsRetrieveResponse::Aggregation,
        average_daily_usage: Float,
        period_end: Date,
        period_start: Date,
        tenant_id: String,
        total_days: Integer,
        budget_estimation_days: Float | nil
      }
    end
  end
end
