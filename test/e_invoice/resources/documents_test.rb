# frozen_string_literal: true

require_relative "../test_helper"

class EInvoice::Test::Resources::DocumentsTest < EInvoice::Test::ResourceTest
  def test_create
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.create

    assert_pattern do
      response => EInvoice::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        amount_due: String | nil,
        attachments: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        currency: EInvoice::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoice::DocumentDirection | nil,
        document_type: EInvoice::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        previous_unpaid_balance: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoice::DocumentState | nil,
        subtotal: String | nil,
        tax_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_retrieve
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.retrieve("document_id")

    assert_pattern do
      response => EInvoice::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        amount_due: String | nil,
        attachments: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        currency: EInvoice::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoice::DocumentDirection | nil,
        document_type: EInvoice::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        previous_unpaid_balance: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoice::DocumentState | nil,
        subtotal: String | nil,
        tax_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end

  def test_delete
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.delete("document_id")

    assert_pattern do
      response => EInvoice::Models::DocumentDeleteResponse
    end

    assert_pattern do
      response => {
        is_deleted: EInvoice::Internal::Type::Boolean
      }
    end
  end

  def test_send_
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.send_("document_id")

    assert_pattern do
      response => EInvoice::DocumentResponse
    end

    assert_pattern do
      response => {
        id: String,
        amount_due: String | nil,
        attachments: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment]) | nil,
        billing_address: String | nil,
        billing_address_recipient: String | nil,
        currency: EInvoice::CurrencyCode | nil,
        customer_address: String | nil,
        customer_address_recipient: String | nil,
        customer_email: String | nil,
        customer_id: String | nil,
        customer_name: String | nil,
        customer_tax_id: String | nil,
        direction: EInvoice::DocumentDirection | nil,
        document_type: EInvoice::DocumentType | nil,
        due_date: Date | nil,
        invoice_date: Date | nil,
        invoice_id: String | nil,
        invoice_total: String | nil,
        items: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::Item]) | nil,
        note: String | nil,
        payment_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::PaymentDetail]) | nil,
        payment_term: String | nil,
        previous_unpaid_balance: String | nil,
        purchase_order: String | nil,
        remittance_address: String | nil,
        remittance_address_recipient: String | nil,
        service_address: String | nil,
        service_address_recipient: String | nil,
        service_end_date: Date | nil,
        service_start_date: Date | nil,
        shipping_address: String | nil,
        shipping_address_recipient: String | nil,
        state: EInvoice::DocumentState | nil,
        subtotal: String | nil,
        tax_details: ^(EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::TaxDetail]) | nil,
        total_discount: String | nil,
        total_tax: String | nil,
        vendor_address: String | nil,
        vendor_address_recipient: String | nil,
        vendor_email: String | nil,
        vendor_name: String | nil,
        vendor_tax_id: String | nil
      }
    end
  end
end
