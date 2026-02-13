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
          construct_pdf: T::Boolean,
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
        # Query param: If true, generate a constructed PDF from the document and include
        # it both as document attachment and embedded in the UBL.
        construct_pdf: nil,
        # Body param
        allowances: nil,
        # Body param: The amount due for payment. Must be positive and rounded to maximum
        # 2 decimals
        amount_due: nil,
        # Body param
        attachments: nil,
        # Body param: The billing address (if different from customer address)
        billing_address: nil,
        # Body param: The recipient name at the billing address
        billing_address_recipient: nil,
        # Body param
        charges: nil,
        # Body param: Currency of the invoice (ISO 4217 currency code)
        currency: nil,
        # Body param: The address of the customer/buyer
        customer_address: nil,
        # Body param: The recipient name at the customer address
        customer_address_recipient: nil,
        # Body param: Customer company ID. For Belgium this is the CBE number or their
        # EUID (European Unique Identifier) number. In the Netherlands this is the KVK
        # number.
        customer_company_id: nil,
        # Body param: The email address of the customer
        customer_email: nil,
        # Body param: The unique identifier for the customer in your system
        customer_id: nil,
        # Body param: The company name of the customer/buyer
        customer_name: nil,
        # Body param: Customer tax ID. For Belgium this is the VAT number. Must include
        # the country prefix
        customer_tax_id: nil,
        # Body param: The direction of the document: INBOUND (purchases) or OUTBOUND
        # (sales)
        direction: nil,
        # Body param: The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
        document_type: nil,
        # Body param: The date when payment is due
        due_date: nil,
        # Body param: The date when the invoice was issued
        invoice_date: nil,
        # Body param: The unique invoice identifier/number
        invoice_id: nil,
        # Body param: The total amount of the invoice including tax (invoice_total =
        # subtotal + total_tax + total_discount). Must be positive and rounded to maximum
        # 2 decimals
        invoice_total: nil,
        # Body param: At least one line item is required
        items: nil,
        # Body param: Additional notes or comments for the invoice
        note: nil,
        # Body param
        payment_details: nil,
        # Body param: The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
        payment_term: nil,
        # Body param: The previous unpaid balance from prior invoices, if any. Must be
        # positive and rounded to maximum 2 decimals
        previous_unpaid_balance: nil,
        # Body param: The purchase order reference number
        purchase_order: nil,
        # Body param: The address where payment should be sent or remitted to
        remittance_address: nil,
        # Body param: The recipient name at the remittance address
        remittance_address_recipient: nil,
        # Body param: The address where services were performed or goods were delivered
        service_address: nil,
        # Body param: The recipient name at the service address
        service_address_recipient: nil,
        # Body param: The end date of the service period or delivery period
        service_end_date: nil,
        # Body param: The start date of the service period or delivery period
        service_start_date: nil,
        # Body param: The shipping/delivery address
        shipping_address: nil,
        # Body param: The recipient name at the shipping address
        shipping_address_recipient: nil,
        # Body param: The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or
        # RECEIVED
        state: nil,
        # Body param: The taxable base of the invoice. Should be the sum of all line
        # items - allowances (for example commercial discounts) + charges with impact on
        # VAT. Must be positive and rounded to maximum 2 decimals
        subtotal: nil,
        # Body param: Tax category code of the invoice (e.g., S for standard rate, Z for
        # zero rate, E for exempt)
        tax_code: nil,
        # Body param
        tax_details: nil,
        # Body param: The net financial discount/charge of the invoice (non-VAT charges
        # minus non-VAT allowances). Can be positive (net charge), negative (net
        # discount), or zero. Must be rounded to maximum 2 decimals
        total_discount: nil,
        # Body param: The total tax amount of the invoice. Must be positive and rounded to
        # maximum 2 decimals
        total_tax: nil,
        # Body param: VATEX code list for VAT exemption reasons
        #
        # Agency: CEF Identifier: vatex
        vatex: nil,
        # Body param: Textual explanation for VAT exemption
        vatex_note: nil,
        # Body param: The address of the vendor/seller
        vendor_address: nil,
        # Body param: The recipient name at the vendor address
        vendor_address_recipient: nil,
        # Body param: Vendor company ID. For Belgium this is the CBE number or their EUID
        # (European Unique Identifier) number. In the Netherlands this is the KVK number.
        vendor_company_id: nil,
        # Body param: The email address of the vendor
        vendor_email: nil,
        # Body param: The name of the vendor/seller/supplier
        vendor_name: nil,
        # Body param: Vendor tax ID. For Belgium this is the VAT number. Must include the
        # country prefix
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

      # Send an invoice or credit note via Peppol. By default, the sender and receiver
      # Peppol IDs are derived from the company (tax) IDs in the document, regardless of
      # whether the document was created from a UBL with a different endpoint ID. To
      # explicitly set the sender or receiver Peppol ID, provide them via the query
      # parameters (sender_peppol_scheme, sender_peppol_id, receiver_peppol_scheme,
      # receiver_peppol_id).
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
