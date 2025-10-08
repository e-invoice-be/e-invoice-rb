# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#create_from_pdf
    class DocumentCreateFromPdfResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute allowances
      #
      #   @return [Array<EInvoiceAPI::Models::Allowance>, nil]
      optional :allowances, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Allowance] }, nil?: true

      # @!attribute amount_due
      #   The amount due of the invoice. Must be positive and rounded to maximum 2
      #   decimals
      #
      #   @return [String, nil]
      optional :amount_due, String, nil?: true

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

      # @!attribute charges
      #
      #   @return [Array<EInvoiceAPI::Models::Charge>, nil]
      optional :charges, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Charge] }, nil?: true

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
      #   The total amount of the invoice (so invoice_total = subtotal + total_tax +
      #   total_discount). Must be positive and rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :invoice_total, String, nil?: true

      # @!attribute items
      #   At least one line item is required
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item>, nil]
      optional :items,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item] }

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
      #   The previous unpaid balance of the invoice, if any. Must be positive and rounded
      #   to maximum 2 decimals
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
      #   @return [Symbol, EInvoiceAPI::Models::DocumentState, nil]
      optional :state, enum: -> { EInvoiceAPI::DocumentState }

      # @!attribute subtotal
      #   The taxable base of the invoice. Should be the sum of all line items -
      #   allowances (for example commercial discounts) + charges with impact on VAT. Must
      #   be positive and rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :subtotal, String, nil?: true

      # @!attribute success
      #   Whether the PDF was successfully converted into a compliant e-invoice
      #
      #   @return [Boolean, nil]
      optional :success, EInvoiceAPI::Internal::Type::Boolean

      # @!attribute tax_code
      #   Tax category code of the invoice
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode, nil]
      optional :tax_code, enum: -> { EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode }

      # @!attribute tax_details
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail>, nil]
      optional :tax_details,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail] },
               nil?: true

      # @!attribute total_discount
      #   The total financial discount of the invoice (so discounts not subject to VAT).
      #   Must be positive and rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :total_discount, String, nil?: true

      # @!attribute total_tax
      #   The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :total_tax, String, nil?: true

      # @!attribute ubl_document
      #   The UBL document as an XML string
      #
      #   @return [String, nil]
      optional :ubl_document, String, nil?: true

      # @!attribute vatex
      #   VATEX code list for VAT exemption reasons
      #
      #   Agency: CEF Identifier: vatex
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex, nil]
      optional :vatex, enum: -> { EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex }, nil?: true

      # @!attribute vatex_note
      #   VAT exemption note of the invoice
      #
      #   @return [String, nil]
      optional :vatex_note, String, nil?: true

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

      # @!method initialize(allowances: nil, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, charges: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, success: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, ubl_document: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::DocumentCreateFromPdfResponse} for more details.
      #
      #   @param allowances [Array<EInvoiceAPI::Models::Allowance>, nil]
      #
      #   @param amount_due [String, nil] The amount due of the invoice. Must be positive and rounded to maximum 2 decimal
      #
      #   @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      #   @param billing_address [String, nil]
      #
      #   @param billing_address_recipient [String, nil]
      #
      #   @param charges [Array<EInvoiceAPI::Models::Charge>, nil]
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
      #   @param invoice_total [String, nil] The total amount of the invoice (so invoice_total = subtotal + total_tax + total
      #
      #   @param items [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item>] At least one line item is required
      #
      #   @param note [String, nil]
      #
      #   @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      #
      #   @param payment_term [String, nil]
      #
      #   @param previous_unpaid_balance [String, nil] The previous unpaid balance of the invoice, if any. Must be positive and rounded
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
      #   @param subtotal [String, nil] The taxable base of the invoice. Should be the sum of all line items - allowance
      #
      #   @param success [Boolean] Whether the PDF was successfully converted into a compliant e-invoice
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode] Tax category code of the invoice
      #
      #   @param tax_details [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail>, nil]
      #
      #   @param total_discount [String, nil] The total financial discount of the invoice (so discounts not subject to VAT). M
      #
      #   @param total_tax [String, nil] The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
      #
      #   @param ubl_document [String, nil] The UBL document as an XML string
      #
      #   @param vatex [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex, nil] VATEX code list for VAT exemption reasons
      #
      #   @param vatex_note [String, nil] VAT exemption note of the invoice
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

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute allowances
        #   The allowances of the line item.
        #
        #   @return [Array<EInvoiceAPI::Models::Allowance>, nil]
        optional :allowances, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Allowance] }, nil?: true

        # @!attribute amount
        #   The total amount of the line item, exclusive of VAT, after subtracting line
        #   level allowances and adding line level charges. Must be rounded to maximum 2
        #   decimals
        #
        #   @return [String, nil]
        optional :amount, String, nil?: true

        # @!attribute charges
        #   The charges of the line item.
        #
        #   @return [Array<EInvoiceAPI::Models::Charge>, nil]
        optional :charges, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Charge] }, nil?: true

        # @!attribute date
        #
        #   @return [nil]
        optional :date, NilClass

        # @!attribute description
        #   The description of the line item.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute product_code
        #   The product code of the line item.
        #
        #   @return [String, nil]
        optional :product_code, String, nil?: true

        # @!attribute quantity
        #   The quantity of items (goods or services) that is the subject of the line item.
        #   Must be rounded to maximum 4 decimals
        #
        #   @return [String, nil]
        optional :quantity, String, nil?: true

        # @!attribute tax
        #   The total VAT amount for the line item. Must be rounded to maximum 2 decimals
        #
        #   @return [String, nil]
        optional :tax, String, nil?: true

        # @!attribute tax_rate
        #   The VAT rate of the line item expressed as percentage with 2 decimals
        #
        #   @return [String, nil]
        optional :tax_rate, String, nil?: true

        # @!attribute unit
        #   Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @return [Symbol, EInvoiceAPI::Models::UnitOfMeasureCode, nil]
        optional :unit, enum: -> { EInvoiceAPI::UnitOfMeasureCode }, nil?: true

        # @!attribute unit_price
        #   The unit price of the line item. Must be rounded to maximum 2 decimals
        #
        #   @return [String, nil]
        optional :unit_price, String, nil?: true

        # @!method initialize(allowances: nil, amount: nil, charges: nil, date: nil, description: nil, product_code: nil, quantity: nil, tax: nil, tax_rate: nil, unit: nil, unit_price: nil)
        #   Some parameter documentations has been truncated, see
        #   {EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item} for more details.
        #
        #   @param allowances [Array<EInvoiceAPI::Models::Allowance>, nil] The allowances of the line item.
        #
        #   @param amount [String, nil] The total amount of the line item, exclusive of VAT, after subtracting line leve
        #
        #   @param charges [Array<EInvoiceAPI::Models::Charge>, nil] The charges of the line item.
        #
        #   @param date [nil]
        #
        #   @param description [String, nil] The description of the line item.
        #
        #   @param product_code [String, nil] The product code of the line item.
        #
        #   @param quantity [String, nil] The quantity of items (goods or services) that is the subject of the line item.
        #
        #   @param tax [String, nil] The total VAT amount for the line item. Must be rounded to maximum 2 decimals
        #
        #   @param tax_rate [String, nil] The VAT rate of the line item expressed as percentage with 2 decimals
        #
        #   @param unit [Symbol, EInvoiceAPI::Models::UnitOfMeasureCode, nil] Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        #
        #   @param unit_price [String, nil] The unit price of the line item. Must be rounded to maximum 2 decimals
      end

      # Tax category code of the invoice
      #
      # @see EInvoiceAPI::Models::DocumentCreateFromPdfResponse#tax_code
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        AE = :AE
        E = :E
        S = :S
        Z = :Z
        G = :G
        O = :O
        K = :K
        L = :L
        M = :M
        B = :B

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
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

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      #
      # @see EInvoiceAPI::Models::DocumentCreateFromPdfResponse#vatex
      module Vatex
        extend EInvoiceAPI::Internal::Type::Enum

        VATEX_EU_79_C = :"VATEX-EU-79-C"
        VATEX_EU_132 = :"VATEX-EU-132"
        VATEX_EU_132_1_A = :"VATEX-EU-132-1A"
        VATEX_EU_132_1_B = :"VATEX-EU-132-1B"
        VATEX_EU_132_1_C = :"VATEX-EU-132-1C"
        VATEX_EU_132_1_D = :"VATEX-EU-132-1D"
        VATEX_EU_132_1_E = :"VATEX-EU-132-1E"
        VATEX_EU_132_1_F = :"VATEX-EU-132-1F"
        VATEX_EU_132_1_G = :"VATEX-EU-132-1G"
        VATEX_EU_132_1_H = :"VATEX-EU-132-1H"
        VATEX_EU_132_1_I = :"VATEX-EU-132-1I"
        VATEX_EU_132_1_J = :"VATEX-EU-132-1J"
        VATEX_EU_132_1_K = :"VATEX-EU-132-1K"
        VATEX_EU_132_1_L = :"VATEX-EU-132-1L"
        VATEX_EU_132_1_M = :"VATEX-EU-132-1M"
        VATEX_EU_132_1_N = :"VATEX-EU-132-1N"
        VATEX_EU_132_1_O = :"VATEX-EU-132-1O"
        VATEX_EU_132_1_P = :"VATEX-EU-132-1P"
        VATEX_EU_132_1_Q = :"VATEX-EU-132-1Q"
        VATEX_EU_143 = :"VATEX-EU-143"
        VATEX_EU_143_1_A = :"VATEX-EU-143-1A"
        VATEX_EU_143_1_B = :"VATEX-EU-143-1B"
        VATEX_EU_143_1_C = :"VATEX-EU-143-1C"
        VATEX_EU_143_1_D = :"VATEX-EU-143-1D"
        VATEX_EU_143_1_E = :"VATEX-EU-143-1E"
        VATEX_EU_143_1_F = :"VATEX-EU-143-1F"
        VATEX_EU_143_1_FA = :"VATEX-EU-143-1FA"
        VATEX_EU_143_1_G = :"VATEX-EU-143-1G"
        VATEX_EU_143_1_H = :"VATEX-EU-143-1H"
        VATEX_EU_143_1_I = :"VATEX-EU-143-1I"
        VATEX_EU_143_1_J = :"VATEX-EU-143-1J"
        VATEX_EU_143_1_K = :"VATEX-EU-143-1K"
        VATEX_EU_143_1_L = :"VATEX-EU-143-1L"
        VATEX_EU_144 = :"VATEX-EU-144"
        VATEX_EU_146_1_E = :"VATEX-EU-146-1E"
        VATEX_EU_148 = :"VATEX-EU-148"
        VATEX_EU_148_A = :"VATEX-EU-148-A"
        VATEX_EU_148_B = :"VATEX-EU-148-B"
        VATEX_EU_148_C = :"VATEX-EU-148-C"
        VATEX_EU_148_D = :"VATEX-EU-148-D"
        VATEX_EU_148_E = :"VATEX-EU-148-E"
        VATEX_EU_148_F = :"VATEX-EU-148-F"
        VATEX_EU_148_G = :"VATEX-EU-148-G"
        VATEX_EU_151 = :"VATEX-EU-151"
        VATEX_EU_151_1_A = :"VATEX-EU-151-1A"
        VATEX_EU_151_1_AA = :"VATEX-EU-151-1AA"
        VATEX_EU_151_1_B = :"VATEX-EU-151-1B"
        VATEX_EU_151_1_C = :"VATEX-EU-151-1C"
        VATEX_EU_151_1_D = :"VATEX-EU-151-1D"
        VATEX_EU_151_1_E = :"VATEX-EU-151-1E"
        VATEX_EU_159 = :"VATEX-EU-159"
        VATEX_EU_309 = :"VATEX-EU-309"
        VATEX_EU_AE = :"VATEX-EU-AE"
        VATEX_EU_D = :"VATEX-EU-D"
        VATEX_EU_F = :"VATEX-EU-F"
        VATEX_EU_G = :"VATEX-EU-G"
        VATEX_EU_I = :"VATEX-EU-I"
        VATEX_EU_IC = :"VATEX-EU-IC"
        VATEX_EU_O = :"VATEX-EU-O"
        VATEX_EU_J = :"VATEX-EU-J"
        VATEX_FR_FRANCHISE = :"VATEX-FR-FRANCHISE"
        VATEX_FR_CNWVAT = :"VATEX-FR-CNWVAT"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
