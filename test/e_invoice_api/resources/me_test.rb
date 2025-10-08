# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::MeTest < EInvoiceAPI::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @e_invoice.me.retrieve

    assert_pattern do
      response => EInvoiceAPI::Models::MeRetrieveResponse
    end

    assert_pattern do
      response => {
        credit_balance: Integer,
        name: String,
        plan: EInvoiceAPI::Models::MeRetrieveResponse::Plan,
        bcc_recipient_email: String | nil,
        company_address: String | nil,
        company_city: String | nil,
        company_country: String | nil,
        company_email: String | nil,
        company_name: String | nil,
        company_number: String | nil,
        company_zip: String | nil,
        description: String | nil,
        ibans: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]) | nil,
        peppol_ids: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]) | nil,
        smp_registration: EInvoiceAPI::Internal::Type::Boolean | nil,
        smp_registration_date: Time | nil
      }
    end
  end
end
