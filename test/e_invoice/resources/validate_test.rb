# frozen_string_literal: true

require_relative "../test_helper"

class EInvoice::Test::Resources::ValidateTest < EInvoice::Test::ResourceTest
  def test_validate_json
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_json

    assert_pattern do
      response => EInvoice::UblDocumentValidation
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String | nil,
        is_valid: EInvoice::Internal::Type::Boolean,
        issues: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::UblDocumentValidation::Issue]),
        ubl_document: String | nil
      }
    end
  end

  def test_validate_peppol_id_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_peppol_id(peppol_id: "peppol_id")

    assert_pattern do
      response => EInvoice::Models::ValidateValidatePeppolIDResponse
    end

    assert_pattern do
      response => {
        business_card: EInvoice::Models::ValidateValidatePeppolIDResponse::BusinessCard | nil,
        business_card_valid: EInvoice::Internal::Type::Boolean,
        dns_valid: EInvoice::Internal::Type::Boolean,
        is_valid: EInvoice::Internal::Type::Boolean,
        supported_document_types: ^(EInvoice::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_validate_ubl_required_params
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.validate.validate_ubl(file: Pathname(__FILE__))

    assert_pattern do
      response => EInvoice::UblDocumentValidation
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String | nil,
        is_valid: EInvoice::Internal::Type::Boolean,
        issues: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::UblDocumentValidation::Issue]),
        ubl_document: String | nil
      }
    end
  end
end
