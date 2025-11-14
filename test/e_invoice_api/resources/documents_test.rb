# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::DocumentsTest < EInvoiceAPI::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @e_invoice.documents.create

    assert_pattern do
      response => EInvoiceAPI::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowances: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Allowance]) | nil,
        amount_due: String | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        charges: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Charge]) | nil,
        currency: EInvoiceAPI::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_company_id: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoiceAPI::DocumentDirection | nil,
        document_type: EInvoiceAPI::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoiceAPI::DocumentState | nil,
        subtotal: String | nil,
        tax_code: EInvoiceAPI::DocumentResponse::TaxCode | nil,
        tax_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vatex: EInvoiceAPI::DocumentResponse::Vatex | nil,
        vatex_note: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_company_id: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @e_invoice.documents.retrieve("document_id")

    assert_pattern do
      response => EInvoiceAPI::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowances: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Allowance]) | nil,
        amount_due: String | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        charges: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Charge]) | nil,
        currency: EInvoiceAPI::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_company_id: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoiceAPI::DocumentDirection | nil,
        document_type: EInvoiceAPI::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoiceAPI::DocumentState | nil,
        subtotal: String | nil,
        tax_code: EInvoiceAPI::DocumentResponse::TaxCode | nil,
        tax_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vatex: EInvoiceAPI::DocumentResponse::Vatex | nil,
        vatex_note: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_company_id: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @e_invoice.documents.delete("document_id")

    assert_pattern do
      response => EInvoiceAPI::Models::DocumentDeleteResponse
    end

    assert_pattern do
      response => {
        is_deleted: EInvoiceAPI::Internal::Type::Boolean
      }
    end
  end

  def test_create_from_pdf_required_params
    skip("Prism tests are disabled")

    response = @e_invoice.documents.create_from_pdf(file: Pathname(__FILE__))

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
        charges: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Charge]) | nil,
        currency: EInvoiceAPI::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_company_id: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoiceAPI::DocumentDirection | nil,
        document_type: EInvoiceAPI::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::PaymentDetailCreate]) | nil,
        payment_term: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
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
        tax_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        ubl_document: String | nil,
        vatex: EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex | nil,
        vatex_note: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_company_id: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_send_
    skip("Prism tests are disabled")

    response = @e_invoice.documents.send_("document_id")

    assert_pattern do
      response => EInvoiceAPI::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowances: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Allowance]) | nil,
        amount_due: String | nil,
        attachments: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        charges: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Charge]) | nil,
        currency: EInvoiceAPI::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_company_id: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoiceAPI::DocumentDirection | nil,
        document_type: EInvoiceAPI::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoiceAPI::DocumentState | nil,
        subtotal: String | nil,
        tax_code: EInvoiceAPI::DocumentResponse::TaxCode | nil,
        tax_details: ^(EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vatex: EInvoiceAPI::DocumentResponse::Vatex | nil,
        vatex_note: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_company_id: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_validate
    skip("Prism tests are disabled")

    response = @e_invoice.documents.validate("document_id")

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
