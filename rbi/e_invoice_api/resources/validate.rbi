# typed: strong

module EInvoiceAPI
  module Resources
    class Validate
      # Validate if the JSON document can be converted to a valid UBL document
      sig do
        params(
          allowances:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Allowance::OrHash]),
          amount_due:
            T.nilable(EInvoiceAPI::DocumentCreate::AmountDue::Variants),
          attachments:
            T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate::OrHash]),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          charges:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Charge::OrHash]),
          currency: EInvoiceAPI::CurrencyCode::OrSymbol,
          customer_address: T.nilable(String),
          customer_address_recipient: T.nilable(String),
          customer_email: T.nilable(String),
          customer_id: T.nilable(String),
          customer_name: T.nilable(String),
          customer_tax_id: T.nilable(String),
          direction: EInvoiceAPI::DocumentDirection::OrSymbol,
          document_type: EInvoiceAPI::DocumentType::OrSymbol,
          due_date: T.nilable(Date),
          invoice_date: T.nilable(Date),
          invoice_id: T.nilable(String),
          invoice_total:
            T.nilable(EInvoiceAPI::DocumentCreate::InvoiceTotal::Variants),
          items: T::Array[EInvoiceAPI::DocumentCreate::Item::OrHash],
          note: T.nilable(String),
          payment_details:
            T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate::OrHash]),
          payment_term: T.nilable(String),
          previous_unpaid_balance:
            T.nilable(
              EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
            ),
          purchase_order: T.nilable(String),
          remittance_address: T.nilable(String),
          remittance_address_recipient: T.nilable(String),
          service_address: T.nilable(String),
          service_address_recipient: T.nilable(String),
          service_end_date: T.nilable(Date),
          service_start_date: T.nilable(Date),
          shipping_address: T.nilable(String),
          shipping_address_recipient: T.nilable(String),
          state: EInvoiceAPI::DocumentState::OrSymbol,
          subtotal: T.nilable(EInvoiceAPI::DocumentCreate::Subtotal::Variants),
          tax_code: EInvoiceAPI::DocumentCreate::TaxCode::OrSymbol,
          tax_details:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::TaxDetail::OrHash]),
          total_discount:
            T.nilable(EInvoiceAPI::DocumentCreate::TotalDiscount::Variants),
          total_tax: T.nilable(EInvoiceAPI::DocumentCreate::TotalTax::Variants),
          vatex: T.nilable(EInvoiceAPI::DocumentCreate::Vatex::OrSymbol),
          vatex_note: T.nilable(String),
          vendor_address: T.nilable(String),
          vendor_address_recipient: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::UblDocumentValidation)
      end
      def validate_json(
        allowances: nil,
        # The amount due of the invoice. Must be positive and rounded to maximum 2
        # decimals
        amount_due: nil,
        attachments: nil,
        billing_address: nil,
        billing_address_recipient: nil,
        charges: nil,
        # Currency of the invoice
        currency: nil,
        customer_address: nil,
        customer_address_recipient: nil,
        customer_email: nil,
        customer_id: nil,
        customer_name: nil,
        customer_tax_id: nil,
        direction: nil,
        document_type: nil,
        due_date: nil,
        invoice_date: nil,
        invoice_id: nil,
        # The total amount of the invoice (so invoice_total = subtotal + total_tax +
        # total_discount). Must be positive and rounded to maximum 2 decimals
        invoice_total: nil,
        # At least one line item is required
        items: nil,
        note: nil,
        payment_details: nil,
        payment_term: nil,
        # The previous unpaid balance of the invoice, if any. Must be positive and rounded
        # to maximum 2 decimals
        previous_unpaid_balance: nil,
        purchase_order: nil,
        remittance_address: nil,
        remittance_address_recipient: nil,
        service_address: nil,
        service_address_recipient: nil,
        service_end_date: nil,
        service_start_date: nil,
        shipping_address: nil,
        shipping_address_recipient: nil,
        state: nil,
        # The taxable base of the invoice. Should be the sum of all line items -
        # allowances (for example commercial discounts) + charges with impact on VAT. Must
        # be positive and rounded to maximum 2 decimals
        subtotal: nil,
        # Tax category code of the invoice
        tax_code: nil,
        tax_details: nil,
        # The total financial discount of the invoice (so discounts not subject to VAT).
        # Must be positive and rounded to maximum 2 decimals
        total_discount: nil,
        # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
        total_tax: nil,
        # VATEX code list for VAT exemption reasons
        #
        # Agency: CEF Identifier: vatex
        vatex: nil,
        # VAT exemption note of the invoice
        vatex_note: nil,
        vendor_address: nil,
        vendor_address_recipient: nil,
        vendor_email: nil,
        vendor_name: nil,
        vendor_tax_id: nil,
        request_options: {}
      )
      end

      # Validate if a Peppol ID exists in the Peppol network and retrieve supported
      # document types. The peppol_id must be in the form of `<scheme>:<id>`. The scheme
      # is a 4-digit code representing the identifier scheme, and the id is the actual
      # identifier value. For example, for a Belgian company it is `0208:0123456789`
      # (where 0208 is the scheme for Belgian enterprises, followed by the 10 digits of
      # the official BTW / KBO number).
      sig do
        params(
          peppol_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::ValidateValidatePeppolIDResponse)
      end
      def validate_peppol_id(
        # Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a
        # Belgian company.
        peppol_id:,
        request_options: {}
      )
      end

      # Validate the correctness of a UBL document
      sig do
        params(
          file: EInvoiceAPI::Internal::FileInput,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::UblDocumentValidation)
      end
      def validate_ubl(file:, request_options: {})
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
