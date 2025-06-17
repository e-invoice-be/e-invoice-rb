# frozen_string_literal: true

require_relative "../test_helper"

class EInvoice::Test::Resources::LookupTest < EInvoice::Test::ResourceTest
  def test_retrieve_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.lookup.retrieve(peppol_id: "peppol_id")

    assert_pattern do
      response => EInvoice::Models::LookupRetrieveResponse
    end

    assert_pattern do
      response => {
        business_card: EInvoice::Models::LookupRetrieveResponse::BusinessCard,
        certificates: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::Certificate]),
        dns_info: EInvoice::Models::LookupRetrieveResponse::DNSInfo,
        errors: ^(EInvoice::Internal::Type::ArrayOf[String]),
        execution_time_ms: Float,
        query_metadata: EInvoice::Models::LookupRetrieveResponse::QueryMetadata,
        service_metadata: EInvoice::Models::LookupRetrieveResponse::ServiceMetadata,
        status: String
      }
    end
  end
end
