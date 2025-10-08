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
      # @overload create(amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil, request_options: {})
      #
      # @param amount_due [Float, String, nil]
      #
      # @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      # @param billing_address [String, nil]
      #
      # @param billing_address_recipient [String, nil]
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
      # @param invoice_total [Float, String, nil]
      #
      # @param items [Array<EInvoiceAPI::Models::DocumentCreate::Item>, nil]
      #
      # @param note [String, nil]
      #
      # @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
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
      # @param state [Symbol, EInvoiceAPI::Models::DocumentState]
      #
      # @param subtotal [Float, String, nil]
      #
      # @param tax_code [Symbol, EInvoiceAPI::Models::DocumentCreate::TaxCode] Tax category code of the invoice
      #
      # @param tax_details [Array<EInvoiceAPI::Models::DocumentCreate::TaxDetail>, nil]
      #
      # @param total_discount [Float, String, nil]
      #
      # @param total_tax [Float, String, nil]
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

      # Send an invoice or credit note via Peppol
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
