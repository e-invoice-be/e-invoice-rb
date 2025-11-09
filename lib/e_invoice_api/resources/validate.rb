# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Validate
      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::ValidateValidateJsonParams} for more details.
      #
      # Validate if the JSON document can be converted to a valid UBL document
      #
      # @overload validate_json(allowances: nil, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, charges: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_company_id: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_company_id: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil, request_options: {})
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
      # @return [EInvoiceAPI::Models::UblDocumentValidation]
      #
      # @see EInvoiceAPI::Models::ValidateValidateJsonParams
      def validate_json(params = {})
        parsed, options = EInvoiceAPI::ValidateValidateJsonParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/validate/json",
          body: parsed,
          model: EInvoiceAPI::UblDocumentValidation,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::ValidateValidatePeppolIDParams} for more details.
      #
      # Validate if a Peppol ID exists in the Peppol network and retrieve supported
      # document types. The peppol_id must be in the form of `<scheme>:<id>`. The scheme
      # is a 4-digit code representing the identifier scheme, and the id is the actual
      # identifier value. For example, for a Belgian company it is `0208:0123456789`
      # (where 0208 is the scheme for Belgian enterprises, followed by the 10 digits of
      # the official BTW / KBO number).
      #
      # @overload validate_peppol_id(peppol_id:, request_options: {})
      #
      # @param peppol_id [String] Peppol ID in the format `<scheme>:<id>`. Example: `0208:1018265814` for a Belgia
      #
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::ValidateValidatePeppolIDResponse]
      #
      # @see EInvoiceAPI::Models::ValidateValidatePeppolIDParams
      def validate_peppol_id(params)
        parsed, options = EInvoiceAPI::ValidateValidatePeppolIDParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/validate/peppol-id",
          query: parsed,
          model: EInvoiceAPI::Models::ValidateValidatePeppolIDResponse,
          options: options
        )
      end

      # Validate the correctness of a UBL document
      #
      # @overload validate_ubl(file:, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
      # @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoiceAPI::Models::UblDocumentValidation]
      #
      # @see EInvoiceAPI::Models::ValidateValidateUblParams
      def validate_ubl(params)
        parsed, options = EInvoiceAPI::ValidateValidateUblParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/validate/ubl",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: EInvoiceAPI::UblDocumentValidation,
          options: options
        )
      end

      # @api private
      #
      # @param client [EInvoiceAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
