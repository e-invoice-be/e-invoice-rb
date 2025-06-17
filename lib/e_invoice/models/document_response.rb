# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Documents#create
    class DocumentResponse < EInvoice::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute amount_due
      #
      #   @return [String, nil]
      optional :amount_due, String, nil?: true

      # @!attribute attachments
      #
      #   @return [Array<EInvoice::Models::Documents::DocumentAttachment>, nil]
      optional :attachments, -> { EInvoice::Internal::Type::ArrayOf[EInvoice::Documents::DocumentAttachment] }

      # @!attribute billing_address
      #
      #   @return [String, nil]
      optional :billing_address, String, nil?: true

      # @!attribute billing_address_recipient
      #
      #   @return [String, nil]
      optional :billing_address_recipient, String, nil?: true

      # @!attribute currency
      #   Currency of the invoice
      #
      #   @return [Symbol, EInvoice::Models::CurrencyCode, nil]
      optional :currency, enum: -> { EInvoice::CurrencyCode }

      # @!attribute customer_address
      #
      #   @return [String, nil]
      optional :customer_address, String, nil?: true

      # @!attribute customer_address_recipient
      #
      #   @return [String, nil]
      optional :customer_address_recipient, String, nil?: true

      # @!attribute customer_email
      #
      #   @return [String, nil]
      optional :customer_email, String, nil?: true

      # @!attribute customer_id
      #
      #   @return [String, nil]
      optional :customer_id, String, nil?: true

      # @!attribute customer_name
      #
      #   @return [String, nil]
      optional :customer_name, String, nil?: true

      # @!attribute customer_tax_id
      #
      #   @return [String, nil]
      optional :customer_tax_id, String, nil?: true

      # @!attribute direction
      #
      #   @return [Symbol, EInvoice::Models::DocumentDirection, nil]
      optional :direction, enum: -> { EInvoice::DocumentDirection }

      # @!attribute document_type
      #
      #   @return [Symbol, EInvoice::Models::DocumentType, nil]
      optional :document_type, enum: -> { EInvoice::DocumentType }

      # @!attribute due_date
      #
      #   @return [Date, nil]
      optional :due_date, Date, nil?: true

      # @!attribute invoice_date
      #
      #   @return [Date, nil]
      optional :invoice_date, Date, nil?: true

      # @!attribute invoice_id
      #
      #   @return [String, nil]
      optional :invoice_id, String, nil?: true

      # @!attribute invoice_total
      #
      #   @return [String, nil]
      optional :invoice_total, String, nil?: true

      # @!attribute items
      #
      #   @return [Array<EInvoice::Models::DocumentResponse::Item>, nil]
      optional :items, -> { EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::Item] }

      # @!attribute note
      #
      #   @return [String, nil]
      optional :note, String, nil?: true

      # @!attribute payment_details
      #
      #   @return [Array<EInvoice::Models::DocumentResponse::PaymentDetail>, nil]
      optional :payment_details,
               -> { EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::PaymentDetail] }

      # @!attribute payment_term
      #
      #   @return [String, nil]
      optional :payment_term, String, nil?: true

      # @!attribute previous_unpaid_balance
      #
      #   @return [String, nil]
      optional :previous_unpaid_balance, String, nil?: true

      # @!attribute purchase_order
      #
      #   @return [String, nil]
      optional :purchase_order, String, nil?: true

      # @!attribute remittance_address
      #
      #   @return [String, nil]
      optional :remittance_address, String, nil?: true

      # @!attribute remittance_address_recipient
      #
      #   @return [String, nil]
      optional :remittance_address_recipient, String, nil?: true

      # @!attribute service_address
      #
      #   @return [String, nil]
      optional :service_address, String, nil?: true

      # @!attribute service_address_recipient
      #
      #   @return [String, nil]
      optional :service_address_recipient, String, nil?: true

      # @!attribute service_end_date
      #
      #   @return [Date, nil]
      optional :service_end_date, Date, nil?: true

      # @!attribute service_start_date
      #
      #   @return [Date, nil]
      optional :service_start_date, Date, nil?: true

      # @!attribute shipping_address
      #
      #   @return [String, nil]
      optional :shipping_address, String, nil?: true

      # @!attribute shipping_address_recipient
      #
      #   @return [String, nil]
      optional :shipping_address_recipient, String, nil?: true

      # @!attribute state
      #
      #   @return [Symbol, EInvoice::Models::DocumentState, nil]
      optional :state, enum: -> { EInvoice::DocumentState }

      # @!attribute subtotal
      #
      #   @return [String, nil]
      optional :subtotal, String, nil?: true

      # @!attribute tax_details
      #
      #   @return [Array<EInvoice::Models::DocumentResponse::TaxDetail>, nil]
      optional :tax_details, -> { EInvoice::Internal::Type::ArrayOf[EInvoice::DocumentResponse::TaxDetail] }

      # @!attribute total_discount
      #
      #   @return [String, nil]
      optional :total_discount, String, nil?: true

      # @!attribute total_tax
      #
      #   @return [String, nil]
      optional :total_tax, String, nil?: true

      # @!attribute vendor_address
      #
      #   @return [String, nil]
      optional :vendor_address, String, nil?: true

      # @!attribute vendor_address_recipient
      #
      #   @return [String, nil]
      optional :vendor_address_recipient, String, nil?: true

      # @!attribute vendor_email
      #
      #   @return [String, nil]
      optional :vendor_email, String, nil?: true

      # @!attribute vendor_name
      #
      #   @return [String, nil]
      optional :vendor_name, String, nil?: true

      # @!attribute vendor_tax_id
      #
      #   @return [String, nil]
      optional :vendor_tax_id, String, nil?: true

      # @!method initialize(id:, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_details: nil, total_discount: nil, total_tax: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil)
      #   @param id [String]
      #
      #   @param amount_due [String, nil]
      #
      #   @param attachments [Array<EInvoice::Models::Documents::DocumentAttachment>]
      #
      #   @param billing_address [String, nil]
      #
      #   @param billing_address_recipient [String, nil]
      #
      #   @param currency [Symbol, EInvoice::Models::CurrencyCode] Currency of the invoice
      #
      #   @param customer_address [String, nil]
      #
      #   @param customer_address_recipient [String, nil]
      #
      #   @param customer_email [String, nil]
      #
      #   @param customer_id [String, nil]
      #
      #   @param customer_name [String, nil]
      #
      #   @param customer_tax_id [String, nil]
      #
      #   @param direction [Symbol, EInvoice::Models::DocumentDirection]
      #
      #   @param document_type [Symbol, EInvoice::Models::DocumentType]
      #
      #   @param due_date [Date, nil]
      #
      #   @param invoice_date [Date, nil]
      #
      #   @param invoice_id [String, nil]
      #
      #   @param invoice_total [String, nil]
      #
      #   @param items [Array<EInvoice::Models::DocumentResponse::Item>]
      #
      #   @param note [String, nil]
      #
      #   @param payment_details [Array<EInvoice::Models::DocumentResponse::PaymentDetail>]
      #
      #   @param payment_term [String, nil]
      #
      #   @param previous_unpaid_balance [String, nil]
      #
      #   @param purchase_order [String, nil]
      #
      #   @param remittance_address [String, nil]
      #
      #   @param remittance_address_recipient [String, nil]
      #
      #   @param service_address [String, nil]
      #
      #   @param service_address_recipient [String, nil]
      #
      #   @param service_end_date [Date, nil]
      #
      #   @param service_start_date [Date, nil]
      #
      #   @param shipping_address [String, nil]
      #
      #   @param shipping_address_recipient [String, nil]
      #
      #   @param state [Symbol, EInvoice::Models::DocumentState]
      #
      #   @param subtotal [String, nil]
      #
      #   @param tax_details [Array<EInvoice::Models::DocumentResponse::TaxDetail>]
      #
      #   @param total_discount [String, nil]
      #
      #   @param total_tax [String, nil]
      #
      #   @param vendor_address [String, nil]
      #
      #   @param vendor_address_recipient [String, nil]
      #
      #   @param vendor_email [String, nil]
      #
      #   @param vendor_name [String, nil]
      #
      #   @param vendor_tax_id [String, nil]

      class Item < EInvoice::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [String, nil]
        optional :amount, String, nil?: true

        # @!attribute date
        #
        #   @return [nil]
        optional :date, NilClass

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute product_code
        #
        #   @return [String, nil]
        optional :product_code, String, nil?: true

        # @!attribute quantity
        #
        #   @return [String, nil]
        optional :quantity, String, nil?: true

        # @!attribute tax
        #
        #   @return [String, nil]
        optional :tax, String, nil?: true

        # @!attribute tax_rate
        #
        #   @return [String, nil]
        optional :tax_rate, String, nil?: true

        # @!attribute unit
        #   Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @return [Symbol, EInvoice::Models::UnitOfMeasureCode, nil]
        optional :unit, enum: -> { EInvoice::UnitOfMeasureCode }, nil?: true

        # @!attribute unit_price
        #
        #   @return [String, nil]
        optional :unit_price, String, nil?: true

        # @!method initialize(amount: nil, date: nil, description: nil, product_code: nil, quantity: nil, tax: nil, tax_rate: nil, unit: nil, unit_price: nil)
        #   @param amount [String, nil]
        #
        #   @param date [nil]
        #
        #   @param description [String, nil]
        #
        #   @param product_code [String, nil]
        #
        #   @param quantity [String, nil]
        #
        #   @param tax [String, nil]
        #
        #   @param tax_rate [String, nil]
        #
        #   @param unit [Symbol, EInvoice::Models::UnitOfMeasureCode, nil] Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @param unit_price [String, nil]
      end

      class PaymentDetail < EInvoice::Internal::Type::BaseModel
        # @!attribute bank_account_number
        #
        #   @return [String, nil]
        optional :bank_account_number, String, nil?: true

        # @!attribute iban
        #
        #   @return [String, nil]
        optional :iban, String, nil?: true

        # @!attribute payment_reference
        #
        #   @return [String, nil]
        optional :payment_reference, String, nil?: true

        # @!attribute swift
        #
        #   @return [String, nil]
        optional :swift, String, nil?: true

        # @!method initialize(bank_account_number: nil, iban: nil, payment_reference: nil, swift: nil)
        #   @param bank_account_number [String, nil]
        #   @param iban [String, nil]
        #   @param payment_reference [String, nil]
        #   @param swift [String, nil]
      end

      class TaxDetail < EInvoice::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [String, nil]
        optional :amount, String, nil?: true

        # @!attribute rate
        #
        #   @return [String, nil]
        optional :rate, String, nil?: true

        # @!method initialize(amount: nil, rate: nil)
        #   @param amount [String, nil]
        #   @param rate [String, nil]
      end
    end
  end
end
