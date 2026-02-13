# frozen_string_literal: true

require_relative "../test_helper"

class EInvoiceAPI::Test::Resources::OutboxTest < EInvoiceAPI::Test::ResourceTest
  def test_list_draft_documents
    skip("Prism tests are disabled")

    response = @e_invoice.outbox.list_draft_documents

    assert_pattern do
      response => EInvoiceAPI::Internal::DocumentsNumberPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => EInvoiceAPI::DocumentResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
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

  def test_list_received_documents
    skip("Prism tests are disabled")

    response = @e_invoice.outbox.list_received_documents

    assert_pattern do
      response => EInvoiceAPI::Internal::DocumentsNumberPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => EInvoiceAPI::DocumentResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
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
end
