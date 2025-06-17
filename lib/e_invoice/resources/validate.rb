# frozen_string_literal: true

module EInvoice
  module Resources
    class Validate
      # Validate if the JSON document can be converted to a valid UBL document
      #
      # @overload validate_json(amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_details: nil, total_discount: nil, total_tax: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil, request_options: {})
      #
      # @param amount_due [Float, String, nil]
      #
      # @param attachments [Array<EInvoice::Models::DocumentAttachmentCreate>, nil]
      #
      # @param billing_address [String, nil]
      #
      # @param billing_address_recipient [String, nil]
      #
      # @param currency [Symbol, EInvoice::Models::CurrencyCode] Currency of the invoice
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
      # @param direction [Symbol, EInvoice::Models::DocumentDirection]
      #
      # @param document_type [Symbol, EInvoice::Models::DocumentType]
      #
      # @param due_date [Date, nil]
      #
      # @param invoice_date [Date, nil]
      #
      # @param invoice_id [String, nil]
      #
      # @param invoice_total [Float, String, nil]
      #
      # @param items [Array<EInvoice::Models::DocumentCreate::Item>, nil]
      #
      # @param note [String, nil]
      #
      # @param payment_details [Array<EInvoice::Models::PaymentDetailCreate>, nil]
      #
      # @param payment_term [String, nil]
      #
      # @param previous_unpaid_balance [Float, String, nil]
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
      # @param state [Symbol, EInvoice::Models::DocumentState]
      #
      # @param subtotal [Float, String, nil]
      #
      # @param tax_details [Array<EInvoice::Models::DocumentCreate::TaxDetail>, nil]
      #
      # @param total_discount [Float, String, nil]
      #
      # @param total_tax [Float, String, nil]
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
      # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoice::Models::UblDocumentValidation]
      #
      # @see EInvoice::Models::ValidateValidateJsonParams
      def validate_json(params = {})
        parsed, options = EInvoice::ValidateValidateJsonParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/validate/json",
          body: parsed,
          model: EInvoice::UblDocumentValidation,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {EInvoice::Models::ValidateValidatePeppolIDParams} for more details.
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
      # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoice::Models::ValidateValidatePeppolIDResponse]
      #
      # @see EInvoice::Models::ValidateValidatePeppolIDParams
      def validate_peppol_id(params)
        parsed, options = EInvoice::ValidateValidatePeppolIDParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/validate/peppol-id",
          query: parsed,
          model: EInvoice::Models::ValidateValidatePeppolIDResponse,
          options: options
        )
      end

      # Validate the correctness of a UBL document
      #
      # @overload validate_ubl(file:, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, EInvoice::FilePart]
      # @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [EInvoice::Models::UblDocumentValidation]
      #
      # @see EInvoice::Models::ValidateValidateUblParams
      def validate_ubl(params)
        parsed, options = EInvoice::ValidateValidateUblParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/validate/ubl",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: EInvoice::UblDocumentValidation,
          options: options
        )
      end

      # @api private
      #
      # @param client [EInvoice::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
