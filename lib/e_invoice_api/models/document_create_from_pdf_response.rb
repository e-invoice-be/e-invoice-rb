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
      #   The amount due for payment. Must be positive and rounded to maximum 2 decimals
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
      #   The billing address (if different from customer address)
      #
      #   @return [String, nil]
      optional :billing_address, String, nil?: true

      # @!attribute billing_address_recipient
      #   The recipient name at the billing address
      #
      #   @return [String, nil]
      optional :billing_address_recipient, String, nil?: true

      # @!attribute charges
      #
      #   @return [Array<EInvoiceAPI::Models::Charge>, nil]
      optional :charges, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Charge] }, nil?: true

      # @!attribute currency
      #   Currency of the invoice (ISO 4217 currency code)
      #
      #   @return [Symbol, EInvoiceAPI::Models::CurrencyCode, nil]
      optional :currency, enum: -> { EInvoiceAPI::CurrencyCode }

      # @!attribute customer_address
      #   The address of the customer/buyer
      #
      #   @return [String, nil]
      optional :customer_address, String, nil?: true

      # @!attribute customer_address_recipient
      #   The recipient name at the customer address
      #
      #   @return [String, nil]
      optional :customer_address_recipient, String, nil?: true

      # @!attribute customer_company_id
      #   Customer company ID. For Belgium this is the CBE number or their EUID (European
      #   Unique Identifier) number. In the Netherlands this is the KVK number.
      #
      #   @return [String, nil]
      optional :customer_company_id, String, nil?: true

      # @!attribute customer_email
      #   The email address of the customer
      #
      #   @return [String, nil]
      optional :customer_email, String, nil?: true

      # @!attribute customer_id
      #   The unique identifier for the customer in your system
      #
      #   @return [String, nil]
      optional :customer_id, String, nil?: true

      # @!attribute customer_name
      #   The company name of the customer/buyer
      #
      #   @return [String, nil]
      optional :customer_name, String, nil?: true

      # @!attribute customer_tax_id
      #   Customer tax ID. For Belgium this is the VAT number. Must include the country
      #   prefix
      #
      #   @return [String, nil]
      optional :customer_tax_id, String, nil?: true

      # @!attribute direction
      #   The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentDirection, nil]
      optional :direction, enum: -> { EInvoiceAPI::DocumentDirection }

      # @!attribute document_type
      #   The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentType, nil]
      optional :document_type, enum: -> { EInvoiceAPI::DocumentType }

      # @!attribute due_date
      #   The date when payment is due
      #
      #   @return [Date, nil]
      optional :due_date, Date, nil?: true

      # @!attribute invoice_date
      #   The date when the invoice was issued
      #
      #   @return [Date, nil]
      optional :invoice_date, Date, nil?: true

      # @!attribute invoice_id
      #   The unique invoice identifier/number
      #
      #   @return [String, nil]
      optional :invoice_id, String, nil?: true

      # @!attribute invoice_total
      #   The total amount of the invoice including tax (invoice_total = subtotal +
      #   total_tax + total_discount). Must be positive and rounded to maximum 2 decimals
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
      #   Additional notes or comments for the invoice
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
      #   The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
      #
      #   @return [String, nil]
      optional :payment_term, String, nil?: true

      # @!attribute previous_unpaid_balance
      #   The previous unpaid balance from prior invoices, if any. Must be positive and
      #   rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :previous_unpaid_balance, String, nil?: true

      # @!attribute purchase_order
      #   The purchase order reference number
      #
      #   @return [String, nil]
      optional :purchase_order, String, nil?: true

      # @!attribute remittance_address
      #   The address where payment should be sent or remitted to
      #
      #   @return [String, nil]
      optional :remittance_address, String, nil?: true

      # @!attribute remittance_address_recipient
      #   The recipient name at the remittance address
      #
      #   @return [String, nil]
      optional :remittance_address_recipient, String, nil?: true

      # @!attribute service_address
      #   The address where services were performed or goods were delivered
      #
      #   @return [String, nil]
      optional :service_address, String, nil?: true

      # @!attribute service_address_recipient
      #   The recipient name at the service address
      #
      #   @return [String, nil]
      optional :service_address_recipient, String, nil?: true

      # @!attribute service_end_date
      #   The end date of the service period or delivery period
      #
      #   @return [Date, nil]
      optional :service_end_date, Date, nil?: true

      # @!attribute service_start_date
      #   The start date of the service period or delivery period
      #
      #   @return [Date, nil]
      optional :service_start_date, Date, nil?: true

      # @!attribute shipping_address
      #   The shipping/delivery address
      #
      #   @return [String, nil]
      optional :shipping_address, String, nil?: true

      # @!attribute shipping_address_recipient
      #   The recipient name at the shipping address
      #
      #   @return [String, nil]
      optional :shipping_address_recipient, String, nil?: true

      # @!attribute state
      #   The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
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
      #   Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      #   for exempt)
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
      #   The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      #   allowances). Can be positive (net charge), negative (net discount), or zero.
      #   Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :total_discount, String, nil?: true

      # @!attribute total_tax
      #   The total tax amount of the invoice. Must be positive and rounded to maximum 2
      #   decimals
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
      #   Textual explanation for VAT exemption
      #
      #   @return [String, nil]
      optional :vatex_note, String, nil?: true

      # @!attribute vendor_address
      #   The address of the vendor/seller
      #
      #   @return [String, nil]
      optional :vendor_address, String, nil?: true

      # @!attribute vendor_address_recipient
      #   The recipient name at the vendor address
      #
      #   @return [String, nil]
      optional :vendor_address_recipient, String, nil?: true

      # @!attribute vendor_company_id
      #   Vendor company ID. For Belgium this is the CBE number or their EUID (European
      #   Unique Identifier) number. In the Netherlands this is the KVK number.
      #
      #   @return [String, nil]
      optional :vendor_company_id, String, nil?: true

      # @!attribute vendor_email
      #   The email address of the vendor
      #
      #   @return [String, nil]
      optional :vendor_email, String, nil?: true

      # @!attribute vendor_name
      #   The name of the vendor/seller/supplier
      #
      #   @return [String, nil]
      optional :vendor_name, String, nil?: true

      # @!attribute vendor_tax_id
      #   Vendor tax ID. For Belgium this is the VAT number. Must include the country
      #   prefix
      #
      #   @return [String, nil]
      optional :vendor_tax_id, String, nil?: true

      # @!method initialize(allowances: nil, amount_due: nil, attachments: nil, billing_address: nil, billing_address_recipient: nil, charges: nil, currency: nil, customer_address: nil, customer_address_recipient: nil, customer_company_id: nil, customer_email: nil, customer_id: nil, customer_name: nil, customer_tax_id: nil, direction: nil, document_type: nil, due_date: nil, invoice_date: nil, invoice_id: nil, invoice_total: nil, items: nil, note: nil, payment_details: nil, payment_term: nil, previous_unpaid_balance: nil, purchase_order: nil, remittance_address: nil, remittance_address_recipient: nil, service_address: nil, service_address_recipient: nil, service_end_date: nil, service_start_date: nil, shipping_address: nil, shipping_address_recipient: nil, state: nil, subtotal: nil, success: nil, tax_code: nil, tax_details: nil, total_discount: nil, total_tax: nil, ubl_document: nil, vatex: nil, vatex_note: nil, vendor_address: nil, vendor_address_recipient: nil, vendor_company_id: nil, vendor_email: nil, vendor_name: nil, vendor_tax_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::DocumentCreateFromPdfResponse} for more details.
      #
      #   @param allowances [Array<EInvoiceAPI::Models::Allowance>, nil]
      #
      #   @param amount_due [String, nil] The amount due for payment. Must be positive and rounded to maximum 2 decimals
      #
      #   @param attachments [Array<EInvoiceAPI::Models::DocumentAttachmentCreate>, nil]
      #
      #   @param billing_address [String, nil] The billing address (if different from customer address)
      #
      #   @param billing_address_recipient [String, nil] The recipient name at the billing address
      #
      #   @param charges [Array<EInvoiceAPI::Models::Charge>, nil]
      #
      #   @param currency [Symbol, EInvoiceAPI::Models::CurrencyCode] Currency of the invoice (ISO 4217 currency code)
      #
      #   @param customer_address [String, nil] The address of the customer/buyer
      #
      #   @param customer_address_recipient [String, nil] The recipient name at the customer address
      #
      #   @param customer_company_id [String, nil] Customer company ID. For Belgium this is the CBE number or their EUID (European
      #
      #   @param customer_email [String, nil] The email address of the customer
      #
      #   @param customer_id [String, nil] The unique identifier for the customer in your system
      #
      #   @param customer_name [String, nil] The company name of the customer/buyer
      #
      #   @param customer_tax_id [String, nil] Customer tax ID. For Belgium this is the VAT number. Must include the country pr
      #
      #   @param direction [Symbol, EInvoiceAPI::Models::DocumentDirection] The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
      #
      #   @param document_type [Symbol, EInvoiceAPI::Models::DocumentType] The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
      #
      #   @param due_date [Date, nil] The date when payment is due
      #
      #   @param invoice_date [Date, nil] The date when the invoice was issued
      #
      #   @param invoice_id [String, nil] The unique invoice identifier/number
      #
      #   @param invoice_total [String, nil] The total amount of the invoice including tax (invoice*total = subtotal + total*
      #
      #   @param items [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item>] At least one line item is required
      #
      #   @param note [String, nil] Additional notes or comments for the invoice
      #
      #   @param payment_details [Array<EInvoiceAPI::Models::PaymentDetailCreate>, nil]
      #
      #   @param payment_term [String, nil] The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
      #
      #   @param previous_unpaid_balance [String, nil] The previous unpaid balance from prior invoices, if any. Must be positive and ro
      #
      #   @param purchase_order [String, nil] The purchase order reference number
      #
      #   @param remittance_address [String, nil] The address where payment should be sent or remitted to
      #
      #   @param remittance_address_recipient [String, nil] The recipient name at the remittance address
      #
      #   @param service_address [String, nil] The address where services were performed or goods were delivered
      #
      #   @param service_address_recipient [String, nil] The recipient name at the service address
      #
      #   @param service_end_date [Date, nil] The end date of the service period or delivery period
      #
      #   @param service_start_date [Date, nil] The start date of the service period or delivery period
      #
      #   @param shipping_address [String, nil] The shipping/delivery address
      #
      #   @param shipping_address_recipient [String, nil] The recipient name at the shipping address
      #
      #   @param state [Symbol, EInvoiceAPI::Models::DocumentState] The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
      #
      #   @param subtotal [String, nil] The taxable base of the invoice. Should be the sum of all line items - allowance
      #
      #   @param success [Boolean] Whether the PDF was successfully converted into a compliant e-invoice
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode] Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      #
      #   @param tax_details [Array<EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail>, nil]
      #
      #   @param total_discount [String, nil] The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      #
      #   @param total_tax [String, nil] The total tax amount of the invoice. Must be positive and rounded to maximum 2 d
      #
      #   @param ubl_document [String, nil] The UBL document as an XML string
      #
      #   @param vatex [Symbol, EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex, nil] VATEX code list for VAT exemption reasons
      #
      #   @param vatex_note [String, nil] Textual explanation for VAT exemption
      #
      #   @param vendor_address [String, nil] The address of the vendor/seller
      #
      #   @param vendor_address_recipient [String, nil] The recipient name at the vendor address
      #
      #   @param vendor_company_id [String, nil] Vendor company ID. For Belgium this is the CBE number or their EUID (European Un
      #
      #   @param vendor_email [String, nil] The email address of the vendor
      #
      #   @param vendor_name [String, nil] The name of the vendor/seller/supplier
      #
      #   @param vendor_tax_id [String, nil] Vendor tax ID. For Belgium this is the VAT number. Must include the country pref

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute allowances
        #   The allowances of the line item.
        #
        #   @return [Array<EInvoiceAPI::Models::Allowance>, nil]
        optional :allowances, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Allowance] }, nil?: true

        # @!attribute amount
        #   The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
        #   allowances and charges. Calculated as: ((unit_price / price_base_quantity) \*
        #   quantity) - allowances + charges. Must be rounded to maximum 2 decimals
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

        # @!attribute price_base_quantity
        #   The item price base quantity (BT-149). The number of item units to which the
        #   price applies. Defaults to 1. Must be rounded to maximum 4 decimals
        #
        #   @return [String, nil]
        optional :price_base_quantity, String, nil?: true

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
        #   The item net price (BT-146). The price of an item, exclusive of VAT, after
        #   subtracting item price discount. Must be rounded to maximum 4 decimals
        #
        #   @return [String, nil]
        optional :unit_price, String, nil?: true

        # @!method initialize(allowances: nil, amount: nil, charges: nil, date: nil, description: nil, price_base_quantity: nil, product_code: nil, quantity: nil, tax: nil, tax_rate: nil, unit: nil, unit_price: nil)
        #   Some parameter documentations has been truncated, see
        #   {EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item} for more details.
        #
        #   @param allowances [Array<EInvoiceAPI::Models::Allowance>, nil] The allowances of the line item.
        #
        #   @param amount [String, nil] The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
        #
        #   @param charges [Array<EInvoiceAPI::Models::Charge>, nil] The charges of the line item.
        #
        #   @param date [nil]
        #
        #   @param description [String, nil] The description of the line item.
        #
        #   @param price_base_quantity [String, nil] The item price base quantity (BT-149). The number of item units to which the pri
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
        #   @param unit_price [String, nil] The item net price (BT-146). The price of an item, exclusive of VAT, after subtr
      end

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
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
        #   The tax amount for this tax category. Must be rounded to maximum 2 decimals
        #
        #   @return [String, nil]
        optional :amount, String, nil?: true

        # @!attribute rate
        #   The tax rate as a percentage (e.g., '21.00', '6.00', '0.00')
        #
        #   @return [String, nil]
        optional :rate, String, nil?: true

        # @!method initialize(amount: nil, rate: nil)
        #   @param amount [String, nil] The tax amount for this tax category. Must be rounded to maximum 2 decimals
        #
        #   @param rate [String, nil] The tax rate as a percentage (e.g., '21.00', '6.00', '0.00')
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
