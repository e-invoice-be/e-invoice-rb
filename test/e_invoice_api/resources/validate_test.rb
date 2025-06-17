# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::ValidateTest < EInvoiceAPI::Test::ResourceTest
  def test_validate_json
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_json

    assert_pattern do
      response => EInvoiceAPI::UblDocumentValidation
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String | nil,
        is_valid: EInvoiceAPI::Internal::Type::Boolean,
        issues: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::UblDocumentValidation::Issue]),
        ubl_document: String | nil
      }
    end
  end

  def test_validate_peppol_id_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_peppol_id(peppol_id: "peppol_id")

    assert_pattern do
      response => EInvoiceAPI::Models::ValidateValidatePeppolIDResponse
    end

    assert_pattern do
      response => {
        business_card: EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard | nil,
        business_card_valid: EInvoiceAPI::Internal::Type::Boolean,
        dns_valid: EInvoiceAPI::Internal::Type::Boolean,
        is_valid: EInvoiceAPI::Internal::Type::Boolean,
        supported_document_types: ^(EInvoiceAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_validate_ubl_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_ubl(file: Pathname(__FILE__))

    assert_pattern do
      response => EInvoiceAPI::UblDocumentValidation
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String | nil,
        is_valid: EInvoiceAPI::Internal::Type::Boolean,
        issues: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::UblDocumentValidation::Issue]),
        ubl_document: String | nil
      }
    end
  end
end
