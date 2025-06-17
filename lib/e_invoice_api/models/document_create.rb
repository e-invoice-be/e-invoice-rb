# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class DocumentCreate < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute amount_due
      #
      #   @return [Float, String, nil]
      optional :amount_due, union: -> { EInvoiceAPI::DocumentCreate::AmountDue }, nil?: true

      # @!attribute attachments
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      optional :attachments,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentAttachmentCreate] },
               nil?: true

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
      #   @return [Symbol, EInvoiceAPI::Models::CurrencyCode, nil]
      optional :currency, enum: -> { EInvoiceAPI::CurrencyCode }

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
      #   @return [Symbol, EInvoiceAPI::Models::DocumentDirection, nil]
      optional :direction, enum: -> { EInvoiceAPI::DocumentDirection }

      # @!attribute document_type
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentType, nil]
      optional :document_type, enum: -> { EInvoiceAPI::DocumentType }

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
      #   @return [Float, String, nil]
      optional :invoice_total, union: -> { EInvoiceAPI::DocumentCreate::InvoiceTotal }, nil?: true

      # @!attribute items
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentCreate::Item>, nil]
      optional :items,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentCreate::Item] },
               nil?: true

      # @!attribute note
      #
      #   @return [String, nil]
      optional :note, String, nil?: true

      # @!attribute payment_details
      #
      #   @return [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      optional :payment_details,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::PaymentDetailCreate] },
               nil?: true

      # @!attribute payment_term
      #
      #   @return [String, nil]
      optional :payment_term, String, nil?: true

      # @!attribute previous_unpaid_balance
      #
      #   @return [Float, String, nil]
      optional :previous_unpaid_balance,
               union: -> { EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance },
               nil?: true

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
      #   @return [Symbol, EInvoiceAPI::Models::DocumentState, nil]
      optional :state, enum: -> { EInvoiceAPI::DocumentState }

      # @!attribute subtotal
      #
      #   @return [Float, String, nil]
      optional :subtotal, union: -> { EInvoiceAPI::DocumentCreate::Subtotal }, nil?: true

      # @!attribute tax_details
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentCreate::TaxDetail>, nil]
      optional :tax_details,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentCreate::TaxDetail] },
               nil?: true

      # @!attribute total_discount
      #
      #   @return [Float, String, nil]
      optional :total_discount, union: -> { EInvoiceAPI::DocumentCreate::TotalDiscount }, nil?: true

      # @!attribute total_tax
      #
      #   @return [Float, String, nil]
      optional :total_tax, union: -> { EInvoiceAPI::DocumentCreate::TotalTax }, nil?: true

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

      # @!method initialize(amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, tax_details: nil, total_discount: nil, total_tax: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil)
      #   @param amount_due [Float, String, nil]
      #
      #   @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      #   @param billing_address [String, nil]
      #
      #   @param billing_address_recipient [String, nil]
      #
      #   @param currency [Symbol, EInvoiceAPI::Models::CurrencyCode] Currency of the invoice
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
      #   @param direction [Symbol, EInvoiceAPI::Models::DocumentDirection]
      #
      #   @param document_type [Symbol, EInvoiceAPI::Models::DocumentType]
      #
      #   @param due_date [Date, nil]
      #
      #   @param invoice_date [Date, nil]
      #
      #   @param invoice_id [String, nil]
      #
      #   @param invoice_total [Float, String, nil]
      #
      #   @param items [Array<EInvoiceAPI::Models::DocumentCreate::Item>, nil]
      #
      #   @param note [String, nil]
      #
      #   @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      #
      #   @param payment_term [String, nil]
      #
      #   @param previous_unpaid_balance [Float, String, nil]
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
      #   @param state [Symbol, EInvoiceAPI::Models::DocumentState]
      #
      #   @param subtotal [Float, String, nil]
      #
      #   @param tax_details [Array<EInvoiceAPI::Models::DocumentCreate::TaxDetail>, nil]
      #
      #   @param total_discount [Float, String, nil]
      #
      #   @param total_tax [Float, String, nil]
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

      # @see EInvoiceAPI::Models::DocumentCreate#amount_due
      module AmountDue
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # @see EInvoiceAPI::Models::DocumentCreate#invoice_total
      module InvoiceTotal
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [Float, String, nil]
        optional :amount, union: -> { EInvoiceAPI::DocumentCreate::Item::Amount }, nil?: true

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
        #   @return [Float, String, nil]
        optional :quantity, union: -> { EInvoiceAPI::DocumentCreate::Item::Quantity }, nil?: true

        # @!attribute tax
        #
        #   @return [Float, String, nil]
        optional :tax, union: -> { EInvoiceAPI::DocumentCreate::Item::Tax }, nil?: true

        # @!attribute tax_rate
        #
        #   @return [String, nil]
        optional :tax_rate, String, nil?: true

        # @!attribute unit
        #   Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @return [Symbol, EInvoiceAPI::Models::UnitOfMeasureCode, nil]
        optional :unit, enum: -> { EInvoiceAPI::UnitOfMeasureCode }, nil?: true

        # @!attribute unit_price
        #
        #   @return [Float, String, nil]
        optional :unit_price, union: -> { EInvoiceAPI::DocumentCreate::Item::UnitPrice }, nil?: true

        # @!method initialize(amount: nil, date: nil, description: nil, product_code: nil, quantity: nil, tax: nil, tax_rate: nil, unit: nil, unit_price: nil)
        #   @param amount [Float, String, nil]
        #
        #   @param date [nil]
        #
        #   @param description [String, nil]
        #
        #   @param product_code [String, nil]
        #
        #   @param quantity [Float, String, nil]
        #
        #   @param tax [Float, String, nil]
        #
        #   @param tax_rate [String, nil]
        #
        #   @param unit [Symbol, EInvoiceAPI::Models::UnitOfMeasureCode, nil] Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @param unit_price [Float, String, nil]

        # @see EInvoiceAPI::Models::DocumentCreate::Item#amount
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end

        # @see EInvoiceAPI::Models::DocumentCreate::Item#quantity
        module Quantity
          extend EInvoiceAPI::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end

        # @see EInvoiceAPI::Models::DocumentCreate::Item#tax
        module Tax
          extend EInvoiceAPI::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end

        # @see EInvoiceAPI::Models::DocumentCreate::Item#unit_price
        module UnitPrice
          extend EInvoiceAPI::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end
      end

      # @see EInvoiceAPI::Models::DocumentCreate#previous_unpaid_balance
      module PreviousUnpaidBalance
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # @see EInvoiceAPI::Models::DocumentCreate#subtotal
      module Subtotal
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [Float, String, nil]
        optional :amount, union: -> { EInvoiceAPI::DocumentCreate::TaxDetail::Amount }, nil?: true

        # @!attribute rate
        #
        #   @return [String, nil]
        optional :rate, String, nil?: true

        # @!method initialize(amount: nil, rate: nil)
        #   @param amount [Float, String, nil]
        #   @param rate [String, nil]

        # @see EInvoiceAPI::Models::DocumentCreate::TaxDetail#amount
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end
      end

      # @see EInvoiceAPI::Models::DocumentCreate#total_discount
      module TotalDiscount
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # @see EInvoiceAPI::Models::DocumentCreate#total_tax
      module TotalTax
        extend EInvoiceAPI::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
