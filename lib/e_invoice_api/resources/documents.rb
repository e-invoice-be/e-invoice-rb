# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Documents
      # @return [EInvoiceAPI::Resources::Documents::Attachments]
      attr_reader :attachments

      # @return [EInvoiceAPI::Resources::Documents::Ubl]
      attr_reader :ubl

      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::DocumentCreateParams} for more details.
      #
      # Create a new invoice or credit note
      #
      # @overload create(allowances: nil, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, charges: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_company_id: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_company_id: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil, request_options: {})
      #
      # @param allowances [Array<EInvoiceAPI::Models::DocumentCreate::Allowance>, nil]
      #
      # @param amount_due [Float, String, nil] The amount due for payment. Must be positive and rounded to maximum 2 decimals
      #
      # @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      # @param billing_address [String, nil] The billing address (if different from customer address)
      #
      # @param billing_address_recipient [String, nil] The recipient name at the billing address
      #
      # @param charges [Array<EInvoiceAPI::Models::DocumentCreate::Charge>, nil]
      #
      # @param currency [Symbol, EInvoiceAPI::Models::CurrencyCode] Currency of the invoice (ISO 4217 currency code)
      #
      # @param customer_address [String, nil] The address of the customer/buyer
      #
      # @param customer_address_recipient [String, nil] The recipient name at the customer address
      #
      # @param customer_company_id [String, nil] Customer company ID. For Belgium this is the CBE number or their EUID (European
      #
      # @param customer_email [String, nil] The email address of the customer
      #
      # @param customer_id [String, nil] The unique identifier for the customer in your system
      #
      # @param customer_name [String, nil] The company name of the customer/buyer
      #
      # @param customer_tax_id [String, nil] Customer tax ID. For Belgium this is the VAT number. Must include the country pr
      #
      # @param direction [Symbol, EInvoiceAPI::Models::DocumentDirection] The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
      #
      # @param document_type [Symbol, EInvoiceAPI::Models::DocumentType] The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
      #
      # @param due_date [Date, nil] The date when payment is due
      #
      # @param invoice_date [Date, nil] The date when the invoice was issued
      #
      # @param invoice_id [String, nil] The unique invoice identifier/number
      #
      # @param invoice_total [Float, String, nil] The total amount of the invoice including tax (invoice*total = subtotal + total*
      #
      # @param items [Array<EInvoiceAPI::Models::DocumentCreate::Item>] At least one line item is required
      #
      # @param note [String, nil] Additional notes or comments for the invoice
      #
      # @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      #
      # @param payment_term [String, nil] The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
      #
      # @param previous_unpaid_balance [Float, String, nil] The previous unpaid balance from prior invoices, if any. Must be positive and ro
      #
      # @param purchase_order [String, nil] The purchase order reference number
      #
      # @param remittance_address [String, nil] The address where payment should be sent or remitted to
      #
      # @param remittance_address_recipient [String, nil] The recipient name at the remittance address
      #
      # @param service_address [String, nil] The address where services were performed or goods were delivered
      #
      # @param service_address_recipient [String, nil] The recipient name at the service address
      #
      # @param service_end_date [Date, nil] The end date of the service period or delivery period
      #
      # @param service_start_date [Date, nil] The start date of the service period or delivery period
      #
      # @param shipping_address [String, nil] The shipping/delivery address
      #
      # @param shipping_address_recipient [String, nil] The recipient name at the shipping address
      #
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState] The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
      #
      # @param subtotal [Float, String, nil] The taxable base of the invoice. Should be the sum of all line items - allowance
      #
      # @param tax_code [Symbol, EInvoiceAPI::Models::DocumentCreate::TaxCode] Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      #
      # @param tax_details [Array<EInvoiceAPI::Models::DocumentCreate::TaxDetail>, nil]
      #
      # @param total_discount [Float, String, nil] The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      #
      # @param total_tax [Float, String, nil] The total tax amount of the invoice. Must be positive and rounded to maximum 2 d
      #
      # @param vatex [Symbol, EInvoiceAPI::Models::DocumentCreate::Vatex, nil] VATEX code list for VAT exemption reasons
      #
      # @param vatex_note [String, nil] Textual explanation for VAT exemption
      #
      # @param vendor_address [String, nil] The address of the vendor/seller
      #
      # @param vendor_address_recipient [String, nil] The recipient name at the vendor address
      #
      # @param vendor_company_id [String, nil] Vendor company ID. For Belgium this is the CBE number or their EUID (European Un
      #
      # @param vendor_email [String, nil] The email address of the vendor
      #
      # @param vendor_name [String, nil] The name of the vendor/seller/supplier
      #
      # @param vendor_tax_id [String, nil] Vendor tax ID. For Belgium this is the VAT number. Must include the country pref
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::DocumentResponse]
      #
      # @see EInvoiceAPI::Models::DocumentCreateParams
      def create(params = {})
        parsed, options = EInvoiceAPI::DocumentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/documents/",
          body: parsed,
          model: EInvoiceAPI::DocumentResponse,
          options: options
        )
      end

      # Get an invoice or credit note by ID
      #
      # @overload retrieve(document_id, request_options: {})
      #
      # @param document_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::DocumentResponse]
      #
      # @see EInvoiceAPI::Models::DocumentRetrieveParams
      def retrieve(document_id, params = {})
        @client.request(
          method: :get,
          path: ["api/documents/%1$s", document_id],
          model: EInvoiceAPI::DocumentResponse,
          options: params[:request_options]
        )
      end

      # Delete an invoice or credit note
      #
      # @overload delete(document_id, request_options: {})
      #
      # @param document_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::DocumentDeleteResponse]
      #
      # @see EInvoiceAPI::Models::DocumentDeleteParams
      def delete(document_id, params = {})
        @client.request(
          method: :delete,
          path: ["api/documents/%1$s", document_id],
          model: EInvoiceAPI::Models::DocumentDeleteResponse,
          options: params[:request_options]
        )
      end

      # Create a new invoice or credit note from a PDF file. If the 'ubl_document' field
      # is set in the response, it indicates that sufficient details were extracted from
      # the PDF to automatically generate a valid UBL document ready for sending. If
      # 'ubl_document' is not set, human intervention may be required to ensure
      # compliance.
      #
      # @overload create_from_pdf(file:, customer_tax_id: nil, vendor_tax_id: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart] Body param
      #
      # @param customer_tax_id [String, nil] Query param
      #
      # @param vendor_tax_id [String, nil] Query param
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::DocumentCreateFromPdfResponse]
      #
      # @see EInvoiceAPI::Models::DocumentCreateFromPdfParams
      def create_from_pdf(params)
        parsed, options = EInvoiceAPI::DocumentCreateFromPdfParams.dump_request(params)
        query_params = [:customer_tax_id, :vendor_tax_id]
        @client.request(
          method: :post,
          path: "api/documents/pdf",
          query: parsed.slice(*query_params),
          headers: {"content-type" => "multipart/form-data"},
          body: parsed.except(*query_params),
          model: EInvoiceAPI::Models::DocumentCreateFromPdfResponse,
          options: options
        )
      end

      # Send an invoice or credit note via Peppol. By default, the sender and receiver
      # Peppol IDs are derived from the company (tax) IDs in the document, regardless of
      # whether the document was created from a UBL with a different endpoint ID. To
      # explicitly set the sender or receiver Peppol ID, provide them via the query
      # parameters (sender_peppol_scheme, sender_peppol_id, receiver_peppol_scheme,
      # receiver_peppol_id).
      #
      # @overload send_(document_id, email: nil, receiver_peppol_id: nil, receiver_peppol_scheme: nil, sender_peppol_id: nil, sender_peppol_scheme: nil, request_options: {})
      #
      # @param document_id [String]
      # @param email [String, nil]
      # @param receiver_peppol_id [String, nil]
      # @param receiver_peppol_scheme [String, nil]
      # @param sender_peppol_id [String, nil]
      # @param sender_peppol_scheme [String, nil]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::DocumentResponse]
      #
      # @see EInvoiceAPI::Models::DocumentSendParams
      def send_(document_id, params = {})
        parsed, options = EInvoiceAPI::DocumentSendParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/documents/%1$s/send", document_id],
          query: parsed,
          model: EInvoiceAPI::DocumentResponse,
          options: options
        )
      end

      # Validate a UBL document according to Peppol BIS Billing 3.0
      #
      # @overload validate(document_id, request_options: {})
      #
      # @param document_id [String]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::UblDocumentValidation]
      #
      # @see EInvoiceAPI::Models::DocumentValidateParams
      def validate(document_id, params = {})
        @client.request(
          method: :post,
          path: ["api/documents/%1$s/validate", document_id],
          model: EInvoiceAPI::UblDocumentValidation,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [EInvoiceAPI::Client]
      def initialize(client:)
        @client = client
        @attachments = EInvoiceAPI::Resources::Documents::Attachments.new(client: client)
        @ubl = EInvoiceAPI::Resources::Documents::Ubl.new(client: client)
      end
    end
  end
end
