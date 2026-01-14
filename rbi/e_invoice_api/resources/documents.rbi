# typed: strong

module EInvoiceAPI
  module Resources
    class Documents
      sig { returns(EInvoiceAPI::Resources::Documents::Attachments) }
      attr_reader :attachments

      sig { returns(EInvoiceAPI::Resources::Documents::Ubl) }
      attr_reader :ubl

      # Create a new invoice or credit note
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
          customer_company_id: T.nilable(String),
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
          vendor_company_id: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::DocumentResponse)
      end
      def create(
        allowances: nil,
        # The amount due for payment. Must be positive and rounded to maximum 2 decimals
        amount_due: nil,
        attachments: nil,
        # The billing address (if different from customer address)
        billing_address: nil,
        # The recipient name at the billing address
        billing_address_recipient: nil,
        charges: nil,
        # Currency of the invoice (ISO 4217 currency code)
        currency: nil,
        # The address of the customer/buyer
        customer_address: nil,
        # The recipient name at the customer address
        customer_address_recipient: nil,
        # Customer company ID. For Belgium this is the CBE number or their EUID (European
        # Unique Identifier) number. In the Netherlands this is the KVK number.
        customer_company_id: nil,
        # The email address of the customer
        customer_email: nil,
        # The unique identifier for the customer in your system
        customer_id: nil,
        # The company name of the customer/buyer
        customer_name: nil,
        # Customer tax ID. For Belgium this is the VAT number. Must include the country
        # prefix
        customer_tax_id: nil,
        # The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
        direction: nil,
        # The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
        document_type: nil,
        # The date when payment is due
        due_date: nil,
        # The date when the invoice was issued
        invoice_date: nil,
        # The unique invoice identifier/number
        invoice_id: nil,
        # The total amount of the invoice including tax (invoice_total = subtotal +
        # total_tax + total_discount). Must be positive and rounded to maximum 2 decimals
        invoice_total: nil,
        # At least one line item is required
        items: nil,
        # Additional notes or comments for the invoice
        note: nil,
        payment_details: nil,
        # The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
        payment_term: nil,
        # The previous unpaid balance from prior invoices, if any. Must be positive and
        # rounded to maximum 2 decimals
        previous_unpaid_balance: nil,
        # The purchase order reference number
        purchase_order: nil,
        # The address where payment should be sent or remitted to
        remittance_address: nil,
        # The recipient name at the remittance address
        remittance_address_recipient: nil,
        # The address where services were performed or goods were delivered
        service_address: nil,
        # The recipient name at the service address
        service_address_recipient: nil,
        # The end date of the service period or delivery period
        service_end_date: nil,
        # The start date of the service period or delivery period
        service_start_date: nil,
        # The shipping/delivery address
        shipping_address: nil,
        # The recipient name at the shipping address
        shipping_address_recipient: nil,
        # The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
        state: nil,
        # The taxable base of the invoice. Should be the sum of all line items -
        # allowances (for example commercial discounts) + charges with impact on VAT. Must
        # be positive and rounded to maximum 2 decimals
        subtotal: nil,
        # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
        # for exempt)
        tax_code: nil,
        tax_details: nil,
        # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
        # allowances). Can be positive (net charge), negative (net discount), or zero.
        # Must be rounded to maximum 2 decimals
        total_discount: nil,
        # The total tax amount of the invoice. Must be positive and rounded to maximum 2
        # decimals
        total_tax: nil,
        # VATEX code list for VAT exemption reasons
        #
        # Agency: CEF Identifier: vatex
        vatex: nil,
        # Textual explanation for VAT exemption
        vatex_note: nil,
        # The address of the vendor/seller
        vendor_address: nil,
        # The recipient name at the vendor address
        vendor_address_recipient: nil,
        # Vendor company ID. For Belgium this is the CBE number or their EUID (European
        # Unique Identifier) number. In the Netherlands this is the KVK number.
        vendor_company_id: nil,
        # The email address of the vendor
        vendor_email: nil,
        # The name of the vendor/seller/supplier
        vendor_name: nil,
        # Vendor tax ID. For Belgium this is the VAT number. Must include the country
        # prefix
        vendor_tax_id: nil,
        request_options: {}
      )
      end

      # Get an invoice or credit note by ID
      sig do
        params(
          document_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::DocumentResponse)
      end
      def retrieve(document_id, request_options: {})
      end

      # Delete an invoice or credit note
      sig do
        params(
          document_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::DocumentDeleteResponse)
      end
      def delete(document_id, request_options: {})
      end

      # Create a new invoice or credit note from a PDF file. If the 'ubl_document' field
      # is set in the response, it indicates that sufficient details were extracted from
      # the PDF to automatically generate a valid UBL document ready for sending. If
      # 'ubl_document' is not set, human intervention may be required to ensure
      # compliance.
      sig do
        params(
          file: EInvoiceAPI::Internal::FileInput,
          customer_tax_id: T.nilable(String),
          vendor_tax_id: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::Models::DocumentCreateFromPdfResponse)
      end
      def create_from_pdf(
        # Body param
        file:,
        # Query param
        customer_tax_id: nil,
        # Query param
        vendor_tax_id: nil,
        request_options: {}
      )
      end

      # Send an invoice or credit note via Peppol
      sig do
        params(
          document_id: String,
          email: T.nilable(String),
          receiver_peppol_id: T.nilable(String),
          receiver_peppol_scheme: T.nilable(String),
          sender_peppol_id: T.nilable(String),
          sender_peppol_scheme: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::DocumentResponse)
      end
      def send_(
        document_id,
        email: nil,
        receiver_peppol_id: nil,
        receiver_peppol_scheme: nil,
        sender_peppol_id: nil,
        sender_peppol_scheme: nil,
        request_options: {}
      )
      end

      # Validate a UBL document according to Peppol BIS Billing 3.0
      sig do
        params(
          document_id: String,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(EInvoiceAPI::UblDocumentValidation)
      end
      def validate(document_id, request_options: {})
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
