# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::LookupTest < EInvoiceAPI::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @e_invoice.lookup.retrieve(peppol_id: "peppol_id")

    assert_pattern do
      response => EInvoiceAPI::Models::LookupRetrieveResponse
    end

    assert_pattern do
      response => {
        business_card: EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard,
        certificates: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Certificate]),
        dns_info: EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo,
        errors: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]),
        execution_time_ms: Float,
        query_metadata: EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata,
        service_metadata: EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata,
        status: String
      }
    end
  end

  def test_retrieve_participants_required_params
    skip("Prism tests are disabled")

    response = @e_invoice.lookup.retrieve_participants(query: "query")

    assert_pattern do
      response => EInvoiceAPI::Models::LookupRetrieveParticipantsResponse
    end

    assert_pattern do
      response => {
        query_terms: String,
        search_date: String,
        total_count: Integer,
        used_count: Integer,
        participants: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant]) | nil
      }
    end
  end
end
