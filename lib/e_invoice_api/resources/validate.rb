# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Validate
      # Some parameter documentations has been truncated, see
      # {EInvoiceAPI::Models::ValidateValidateJsonParams} for more details.
      #
      # Validate if the JSON document can be converted to a valid UBL document
      #
      # @overload validate_json(allowances: nil, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, charges: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil, request_options: {})
      #
      # @param allowances [Array<EInvoiceAPI::Models::DocumentCreate::Allowance>, nil]
      #
      # @param amount_due [Float, String, nil] The amount due of the invoice. Must be positive and rounded to maximum 2 decimal
      #
      # @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      # @param billing_address [String, nil]
      #
      # @param billing_address_recipient [String, nil]
      #
      # @param charges [Array<EInvoiceAPI::Models::DocumentCreate::Charge>, nil]
      #
      # @param currency [Symbol, EInvoiceAPI::Models::CurrencyCode] Currency of the invoice
      #
      # @param customer_address [String, nil]
      #
      # @param customer_address_recipient [String, nil]
      #
      # @param customer_email [String, nil]
      #
      # @param customer_id [String, nil]
      #
      # @param customer_name [String, nil]
      #
      # @param customer_tax_id [String, nil]
      #
      # @param direction [Symbol, EInvoiceAPI::Models::DocumentDirection]
      #
      # @param document_type [Symbol, EInvoiceAPI::Models::DocumentType]
      #
      # @param due_date [Date, nil]
      #
      # @param invoice_date [Date, nil]
      #
      # @param invoice_id [String, nil]
      #
      # @param invoice_total [Float, String, nil] The total amount of the invoice (so invoice_total = subtotal + total_tax + total
      #
      # @param items [Array<EInvoiceAPI::Models::DocumentCreate::Item>] At least one line item is required
      #
      # @param note [String, nil]
      #
      # @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      #
      # @param payment_term [String, nil]
      #
      # @param previous_unpaid_balance [Float, String, nil] The previous unpaid balance of the invoice, if any. Must be positive and rounded
      #
      # @param purchase_order [String, nil]
      #
      # @param remittance_address [String, nil]
      #
      # @param remittance_address_recipient [String, nil]
      #
      # @param service_address [String, nil]
      #
      # @param service_address_recipient [String, nil]
      #
      # @param service_end_date [Date, nil]
      #
      # @param service_start_date [Date, nil]
      #
      # @param shipping_address [String, nil]
      #
      # @param shipping_address_recipient [String, nil]
      #
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState]
      #
      # @param subtotal [Float, String, nil] The taxable base of the invoice. Should be the sum of all line items - allowance
      #
      # @param tax_code [Symbol, EInvoiceAPI::Models::DocumentCreate::TaxCode] Tax category code of the invoice
      #
      # @param tax_details [Array<EInvoiceAPI::Models::DocumentCreate::TaxDetail>, nil]
      #
      # @param total_discount [Float, String, nil] The total financial discount of the invoice (so discounts not subject to VAT). M
      #
      # @param total_tax [Float, String, nil] The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
      #
      # @param vatex [Symbol, EInvoiceAPI::Models::DocumentCreate::Vatex, nil] VATEX code list for VAT exemption reasons
      #
      # @param vatex_note [String, nil] VAT exemption note of the invoice
      #
      # @param vendor_address [String, nil]
      #
      # @param vendor_address_recipient [String, nil]
      #
      # @param vendor_email [String, nil]
      #
      # @param vendor_name [String, nil]
      #
      # @param vendor_tax_id [String, nil]
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
