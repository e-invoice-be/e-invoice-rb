# typed: strong

module EInvoice
  module Resources
    class Documents
      sig { returns(EInvoice::Resources::Documents::Attachments) }
      attr_reader :attachments

      sig { returns(EInvoice::Resources::Documents::Ubl) }
      attr_reader :ubl

      # Create a new invoice or credit note
      sig do
        params(
          amount_due: T.nilable(EInvoice::DocumentCreate::AmountDue::Variants),
          attachments:
            T.nilable(T::Array[EInvoice::DocumentAttachmentCreate::OrHash]),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          currency: EInvoice::CurrencyCode::OrSymbol,
          customer_address: T.nilable(String),
          customer_address_recipient: T.nilable(String),
          customer_email: T.nilable(String),
          customer_id: T.nilable(String),
          customer_name: T.nilable(String),
          customer_tax_id: T.nilable(String),
          direction: EInvoice::DocumentDirection::OrSymbol,
          document_type: EInvoice::DocumentType::OrSymbol,
          due_date: T.nilable(Date),
          invoice_date: T.nilable(Date),
          invoice_id: T.nilable(String),
          invoice_total:
            T.nilable(EInvoice::DocumentCreate::InvoiceTotal::Variants),
          items: T.nilable(T::Array[EInvoice::DocumentCreate::Item::OrHash]),
          note: T.nilable(String),
          payment_details:
            T.nilable(T::Array[EInvoice::PaymentDetailCreate::OrHash]),
          payment_term: T.nilable(String),
          previous_unpaid_balance:
            T.nilable(
              EInvoice::DocumentCreate::PreviousUnpaidBalance::Variants
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
          state: EInvoice::DocumentState::OrSymbol,
          subtotal: T.nilable(EInvoice::DocumentCreate::Subtotal::Variants),
          tax_details:
            T.nilable(T::Array[EInvoice::DocumentCreate::TaxDetail::OrHash]),
          total_discount:
            T.nilable(EInvoice::DocumentCreate::TotalDiscount::Variants),
          total_tax: T.nilable(EInvoice::DocumentCreate::TotalTax::Variants),
          vendor_address: T.nilable(String),
          vendor_address_recipient: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String),
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(EInvoice::DocumentResponse)
      end
      def create(
        amount_due: nil,
        attachments: nil,
        billing_address: nil,
        billing_address_recipient: nil,
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
        invoice_total: nil,
        items: nil,
        note: nil,
        payment_details: nil,
        payment_term: nil,
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
        subtotal: nil,
        tax_details: nil,
        total_discount: nil,
        total_tax: nil,
        vendor_address: nil,
        vendor_address_recipient: nil,
        vendor_email: nil,
        vendor_name: nil,
        vendor_tax_id: nil,
        request_options: {}
      )
      end

      # Get an invoice or credit note by ID
      sig do
        params(
          document_id: String,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(EInvoice::DocumentResponse)
      end
      def retrieve(document_id, request_options: {})
      end

      # Delete an invoice or credit note
      sig do
        params(
          document_id: String,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(EInvoice::Models::DocumentDeleteResponse)
      end
      def delete(document_id, request_options: {})
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
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(EInvoice::DocumentResponse)
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

      # @api private
      sig { params(client: EInvoice::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
