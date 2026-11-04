# frozen_string_literal: true

require_relative "../../test_helper"

class EInvoiceAPI::Test::Resources::Conversion::PdfTest < EInvoiceAPI::Test::ResourceTest
  def test_create_required_params
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.conversion.pdf.create(file: StringIO.new("Example data"))

    assert_pattern do
      response => EInvoiceAPI::Conversion::DocumentCreateFromPdfTask
    end

    assert_pattern do
      response => {
        task_id: String,
        status: EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status | nil
      }
    end
  end

  def test_retrieve
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.conversion.pdf.retrieve("task_id")

    assert_pattern do
      response => EInvoiceAPI::Conversion::DocumentCreateFromPdfTask
    end

    assert_pattern do
      response => {
        task_id: String,
        status: EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status | nil
      }
    end
  end

  def test_result
    skip("Needs a Prism mock server; run scripts/test") unless ENV["PRISM_MOCK"] == "1"

    response = @e_invoice.conversion.pdf.result("task_id")

    assert_pattern do
      response => EInvoiceAPI::Models::DocumentCreateFromPdfResponse
    end

    assert_pattern do
      response => {
        allowances: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Allowance]) | nil,
        amount_due: String | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentAttachmentCreate]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        buyer_reference: String | nil,
        charges: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Charge]) | nil,
        currency: EInvoiceAPI::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_company_id: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_peppol_id: String | nil,
        customer_phone: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoiceAPI::DocumentDirection | nil,
        document_type: EInvoiceAPI::DocumentType | nil,
        due_date: Date | nil,
        error_message: String | nil,
        error_type: String | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::PaymentDetailCreate]) | nil,
        payment_term: String | nil,
        preceding_invoice_date: Date | nil,
        preceding_invoice_id: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        rounding_amount: String | nil,
        sales_order: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoiceAPI::DocumentState | nil,
        subtotal: String | nil,
        success: EInvoiceAPI::Internal::Type::Boolean | nil,
        tax_code: EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode | nil,
        tax_currency: String | nil,
        tax_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        total_tax_in_tax_currency: String | nil,
        ubl_document: String | nil,
        vatex: EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex | nil,
        vatex_note: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_company_id: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_phone: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end
end
