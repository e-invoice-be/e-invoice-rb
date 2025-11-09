# typed: strong

module EInvoiceAPI
  module Models
    class DocumentCreateFromPdfResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[EInvoiceAPI::Allowance])) }
      attr_accessor :allowances

      # The amount due for payment. Must be positive and rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount_due

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate]))
      end
      attr_accessor :attachments

      # The billing address (if different from customer address)
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      # The recipient name at the billing address
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

      sig { returns(T.nilable(T::Array[EInvoiceAPI::Charge])) }
      attr_accessor :charges

      # Currency of the invoice (ISO 4217 currency code)
      sig { returns(T.nilable(EInvoiceAPI::CurrencyCode::TaggedSymbol)) }
      attr_reader :currency

      sig { params(currency: EInvoiceAPI::CurrencyCode::OrSymbol).void }
      attr_writer :currency

      # The address of the customer/buyer
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_address

      # The recipient name at the customer address
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_address_recipient

      # Customer company ID. For Belgium this is the CBE number or their EUID (European
      # Unique Identifier) number. In the Netherlands this is the KVK number.
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_company_id

      # The email address of the customer
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_email

      # The unique identifier for the customer in your system
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_id

      # The company name of the customer/buyer
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_name

      # Customer tax ID. For Belgium this is the VAT number. Must include the country
      # prefix
      sig { returns(T.nilable(String)) }
      attr_accessor :customer_tax_id

      # The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
      sig { returns(T.nilable(EInvoiceAPI::DocumentDirection::TaggedSymbol)) }
      attr_reader :direction

      sig { params(direction: EInvoiceAPI::DocumentDirection::OrSymbol).void }
      attr_writer :direction

      # The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
      sig { returns(T.nilable(EInvoiceAPI::DocumentType::TaggedSymbol)) }
      attr_reader :document_type

      sig { params(document_type: EInvoiceAPI::DocumentType::OrSymbol).void }
      attr_writer :document_type

      # The date when payment is due
      sig { returns(T.nilable(Date)) }
      attr_accessor :due_date

      # The date when the invoice was issued
      sig { returns(T.nilable(Date)) }
      attr_accessor :invoice_date

      # The unique invoice identifier/number
      sig { returns(T.nilable(String)) }
      attr_accessor :invoice_id

      # The total amount of the invoice including tax (invoice_total = subtotal +
      # total_tax + total_discount). Must be positive and rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :invoice_total

      # At least one line item is required
      sig do
        returns(
          T.nilable(
            T::Array[EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item]
          )
        )
      end
      attr_reader :items

      sig do
        params(
          items:
            T::Array[
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item::OrHash
            ]
        ).void
      end
      attr_writer :items

      # Additional notes or comments for the invoice
      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig { returns(T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate])) }
      attr_accessor :payment_details

      # The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

      # The previous unpaid balance from prior invoices, if any. Must be positive and
      # rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :previous_unpaid_balance

      # The purchase order reference number
      sig { returns(T.nilable(String)) }
      attr_accessor :purchase_order

      # The address where payment should be sent or remitted to
      sig { returns(T.nilable(String)) }
      attr_accessor :remittance_address

      # The recipient name at the remittance address
      sig { returns(T.nilable(String)) }
      attr_accessor :remittance_address_recipient

      # The address where services were performed or goods were delivered
      sig { returns(T.nilable(String)) }
      attr_accessor :service_address

      # The recipient name at the service address
      sig { returns(T.nilable(String)) }
      attr_accessor :service_address_recipient

      # The end date of the service period or delivery period
      sig { returns(T.nilable(Date)) }
      attr_accessor :service_end_date

      # The start date of the service period or delivery period
      sig { returns(T.nilable(Date)) }
      attr_accessor :service_start_date

      # The shipping/delivery address
      sig { returns(T.nilable(String)) }
      attr_accessor :shipping_address

      # The recipient name at the shipping address
      sig { returns(T.nilable(String)) }
      attr_accessor :shipping_address_recipient

      # The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
      sig { returns(T.nilable(EInvoiceAPI::DocumentState::TaggedSymbol)) }
      attr_reader :state

      sig { params(state: EInvoiceAPI::DocumentState::OrSymbol).void }
      attr_writer :state

      # The taxable base of the invoice. Should be the sum of all line items -
      # allowances (for example commercial discounts) + charges with impact on VAT. Must
      # be positive and rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :subtotal

      # Whether the PDF was successfully converted into a compliant e-invoice
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        )
      end
      attr_reader :tax_code

      sig do
        params(
          tax_code:
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::OrSymbol
        ).void
      end
      attr_writer :tax_code

      sig do
        returns(
          T.nilable(
            T::Array[
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail
            ]
          )
        )
      end
      attr_accessor :tax_details

      # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      # allowances). Can be positive (net charge), negative (net discount), or zero.
      # Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :total_discount

      # The total tax amount of the invoice. Must be positive and rounded to maximum 2
      # decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :total_tax

      # The UBL document as an XML string
      sig { returns(T.nilable(String)) }
      attr_accessor :ubl_document

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        )
      end
      attr_accessor :vatex

      # Textual explanation for VAT exemption
      sig { returns(T.nilable(String)) }
      attr_accessor :vatex_note

      # The address of the vendor/seller
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_address

      # The recipient name at the vendor address
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_address_recipient

      # Vendor company ID. For Belgium this is the CBE number or their EUID (European
      # Unique Identifier) number. In the Netherlands this is the KVK number.
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_company_id

      # The email address of the vendor
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_email

      # The name of the vendor/seller/supplier
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_name

      # Vendor tax ID. For Belgium this is the VAT number. Must include the country
      # prefix
      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_tax_id

      sig do
        params(
          allowances: T.nilable(T::Array[EInvoiceAPI::Allowance::OrHash]),
          amount_due: T.nilable(String),
          attachments:
            T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate::OrHash]),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          charges: T.nilable(T::Array[EInvoiceAPI::Charge::OrHash]),
          currency: EInvoiceAPI::CurrencyCode::OrSymbol,
          customer_address: T.nilable(String),
          customer_address_recipient: T.nilable(String),
          customer_company_id: T.nilable(String),
          customer_email: T.nilable(String),
          customer_id: T.nilable(String),
          customer_name: T.nilable(String),
          customer_tax_id: T.nilable(String),
          direction: EInvoiceAPI::DocumentDirection::OrSymbol,
          document_type: EInvoiceAPI::DocumentType::OrSymbol,
          due_date: T.nilable(Date),
          invoice_date: T.nilable(Date),
          invoice_id: T.nilable(String),
          invoice_total: T.nilable(String),
          items:
            T::Array[
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item::OrHash
            ],
          note: T.nilable(String),
          payment_details:
            T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate::OrHash]),
          payment_term: T.nilable(String),
          previous_unpaid_balance: T.nilable(String),
          purchase_order: T.nilable(String),
          remittance_address: T.nilable(String),
          remittance_address_recipient: T.nilable(String),
          service_address: T.nilable(String),
          service_address_recipient: T.nilable(String),
          service_end_date: T.nilable(Date),
          service_start_date: T.nilable(Date),
          shipping_address: T.nilable(String),
          shipping_address_recipient: T.nilable(String),
          state: EInvoiceAPI::DocumentState::OrSymbol,
          subtotal: T.nilable(String),
          success: T::Boolean,
          tax_code:
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::OrSymbol,
          tax_details:
            T.nilable(
              T::Array[
                EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail::OrHash
              ]
            ),
          total_discount: T.nilable(String),
          total_tax: T.nilable(String),
          ubl_document: T.nilable(String),
          vatex:
            T.nilable(
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::OrSymbol
            ),
          vatex_note: T.nilable(String),
          vendor_address: T.nilable(String),
          vendor_address_recipient: T.nilable(String),
          vendor_company_id: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        allowances: nil,
        # The amount due for payment. Must be positive and rounded to maximum 2 decimals
        amount_due: nil,
        attachments: nil,
        # The billing address (if different from customer address)
        billing_address: nil,
        # The recipient name at the billing address
        billing_address_recipient: nil,
        charges: nil,
        # Currency of the invoice (ISO 4217 currency code)
        currency: nil,
        # The address of the customer/buyer
        customer_address: nil,
        # The recipient name at the customer address
        customer_address_recipient: nil,
        # Customer company ID. For Belgium this is the CBE number or their EUID (European
        # Unique Identifier) number. In the Netherlands this is the KVK number.
        customer_company_id: nil,
        # The email address of the customer
        customer_email: nil,
        # The unique identifier for the customer in your system
        customer_id: nil,
        # The company name of the customer/buyer
        customer_name: nil,
        # Customer tax ID. For Belgium this is the VAT number. Must include the country
        # prefix
        customer_tax_id: nil,
        # The direction of the document: INBOUND (purchases) or OUTBOUND (sales)
        direction: nil,
        # The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
        document_type: nil,
        # The date when payment is due
        due_date: nil,
        # The date when the invoice was issued
        invoice_date: nil,
        # The unique invoice identifier/number
        invoice_id: nil,
        # The total amount of the invoice including tax (invoice_total = subtotal +
        # total_tax + total_discount). Must be positive and rounded to maximum 2 decimals
        invoice_total: nil,
        # At least one line item is required
        items: nil,
        # Additional notes or comments for the invoice
        note: nil,
        payment_details: nil,
        # The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
        payment_term: nil,
        # The previous unpaid balance from prior invoices, if any. Must be positive and
        # rounded to maximum 2 decimals
        previous_unpaid_balance: nil,
        # The purchase order reference number
        purchase_order: nil,
        # The address where payment should be sent or remitted to
        remittance_address: nil,
        # The recipient name at the remittance address
        remittance_address_recipient: nil,
        # The address where services were performed or goods were delivered
        service_address: nil,
        # The recipient name at the service address
        service_address_recipient: nil,
        # The end date of the service period or delivery period
        service_end_date: nil,
        # The start date of the service period or delivery period
        service_start_date: nil,
        # The shipping/delivery address
        shipping_address: nil,
        # The recipient name at the shipping address
        shipping_address_recipient: nil,
        # The current state of the document: DRAFT, TRANSIT, FAILED, SENT, or RECEIVED
        state: nil,
        # The taxable base of the invoice. Should be the sum of all line items -
        # allowances (for example commercial discounts) + charges with impact on VAT. Must
        # be positive and rounded to maximum 2 decimals
        subtotal: nil,
        # Whether the PDF was successfully converted into a compliant e-invoice
        success: nil,
        # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
        # for exempt)
        tax_code: nil,
        tax_details: nil,
        # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
        # allowances). Can be positive (net charge), negative (net discount), or zero.
        # Must be rounded to maximum 2 decimals
        total_discount: nil,
        # The total tax amount of the invoice. Must be positive and rounded to maximum 2
        # decimals
        total_tax: nil,
        # The UBL document as an XML string
        ubl_document: nil,
        # VATEX code list for VAT exemption reasons
        #
        # Agency: CEF Identifier: vatex
        vatex: nil,
        # Textual explanation for VAT exemption
        vatex_note: nil,
        # The address of the vendor/seller
        vendor_address: nil,
        # The recipient name at the vendor address
        vendor_address_recipient: nil,
        # Vendor company ID. For Belgium this is the CBE number or their EUID (European
        # Unique Identifier) number. In the Netherlands this is the KVK number.
        vendor_company_id: nil,
        # The email address of the vendor
        vendor_email: nil,
        # The name of the vendor/seller/supplier
        vendor_name: nil,
        # Vendor tax ID. For Belgium this is the VAT number. Must include the country
        # prefix
        vendor_tax_id: nil
      )
      end

      sig do
        override.returns(
          {
            allowances: T.nilable(T::Array[EInvoiceAPI::Allowance]),
            amount_due: T.nilable(String),
            attachments:
              T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate]),
            billing_address: T.nilable(String),
            billing_address_recipient: T.nilable(String),
            charges: T.nilable(T::Array[EInvoiceAPI::Charge]),
            currency: EInvoiceAPI::CurrencyCode::TaggedSymbol,
            customer_address: T.nilable(String),
            customer_address_recipient: T.nilable(String),
            customer_company_id: T.nilable(String),
            customer_email: T.nilable(String),
            customer_id: T.nilable(String),
            customer_name: T.nilable(String),
            customer_tax_id: T.nilable(String),
            direction: EInvoiceAPI::DocumentDirection::TaggedSymbol,
            document_type: EInvoiceAPI::DocumentType::TaggedSymbol,
            due_date: T.nilable(Date),
            invoice_date: T.nilable(Date),
            invoice_id: T.nilable(String),
            invoice_total: T.nilable(String),
            items:
              T::Array[
                EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item
              ],
            note: T.nilable(String),
            payment_details:
              T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate]),
            payment_term: T.nilable(String),
            previous_unpaid_balance: T.nilable(String),
            purchase_order: T.nilable(String),
            remittance_address: T.nilable(String),
            remittance_address_recipient: T.nilable(String),
            service_address: T.nilable(String),
            service_address_recipient: T.nilable(String),
            service_end_date: T.nilable(Date),
            service_start_date: T.nilable(Date),
            shipping_address: T.nilable(String),
            shipping_address_recipient: T.nilable(String),
            state: EInvoiceAPI::DocumentState::TaggedSymbol,
            subtotal: T.nilable(String),
            success: T::Boolean,
            tax_code:
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol,
            tax_details:
              T.nilable(
                T::Array[
                  EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail
                ]
              ),
            total_discount: T.nilable(String),
            total_tax: T.nilable(String),
            ubl_document: T.nilable(String),
            vatex:
              T.nilable(
                EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
              ),
            vatex_note: T.nilable(String),
            vendor_address: T.nilable(String),
            vendor_address_recipient: T.nilable(String),
            vendor_company_id: T.nilable(String),
            vendor_email: T.nilable(String),
            vendor_name: T.nilable(String),
            vendor_tax_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Item,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The allowances of the line item.
        sig { returns(T.nilable(T::Array[EInvoiceAPI::Allowance])) }
        attr_accessor :allowances

        # The total amount of the line item, exclusive of VAT, after subtracting line
        # level allowances and adding line level charges. Must be rounded to maximum 2
        # decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        # The charges of the line item.
        sig { returns(T.nilable(T::Array[EInvoiceAPI::Charge])) }
        attr_accessor :charges

        sig { returns(NilClass) }
        attr_accessor :date

        # The description of the line item.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # The product code of the line item.
        sig { returns(T.nilable(String)) }
        attr_accessor :product_code

        # The quantity of items (goods or services) that is the subject of the line item.
        # Must be rounded to maximum 4 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :quantity

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :tax

        # The VAT rate of the line item expressed as percentage with 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)) }
        attr_accessor :unit

        # The unit price of the line item. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :unit_price

        sig do
          params(
            allowances: T.nilable(T::Array[EInvoiceAPI::Allowance::OrHash]),
            amount: T.nilable(String),
            charges: T.nilable(T::Array[EInvoiceAPI::Charge::OrHash]),
            date: NilClass,
            description: T.nilable(String),
            product_code: T.nilable(String),
            quantity: T.nilable(String),
            tax: T.nilable(String),
            tax_rate: T.nilable(String),
            unit: T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol),
            unit_price: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The allowances of the line item.
          allowances: nil,
          # The total amount of the line item, exclusive of VAT, after subtracting line
          # level allowances and adding line level charges. Must be rounded to maximum 2
          # decimals
          amount: nil,
          # The charges of the line item.
          charges: nil,
          date: nil,
          # The description of the line item.
          description: nil,
          # The product code of the line item.
          product_code: nil,
          # The quantity of items (goods or services) that is the subject of the line item.
          # Must be rounded to maximum 4 decimals
          quantity: nil,
          # The total VAT amount for the line item. Must be rounded to maximum 2 decimals
          tax: nil,
          # The VAT rate of the line item expressed as percentage with 2 decimals
          tax_rate: nil,
          # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
          unit: nil,
          # The unit price of the line item. Must be rounded to maximum 2 decimals
          unit_price: nil
        )
        end

        sig do
          override.returns(
            {
              allowances: T.nilable(T::Array[EInvoiceAPI::Allowance]),
              amount: T.nilable(String),
              charges: T.nilable(T::Array[EInvoiceAPI::Charge]),
              date: NilClass,
              description: T.nilable(String),
              product_code: T.nilable(String),
              quantity: T.nilable(String),
              tax: T.nilable(String),
              tax_rate: T.nilable(String),
              unit: T.nilable(EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol),
              unit_price: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE =
          T.let(
            :AE,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        E =
          T.let(
            :E,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        S =
          T.let(
            :S,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        Z =
          T.let(
            :Z,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        G =
          T.let(
            :G,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        O =
          T.let(
            :O,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        K =
          T.let(
            :K,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        L =
          T.let(
            :L,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        M =
          T.let(
            :M,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )
        B =
          T.let(
            :B,
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::TaxDetail,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The tax amount for this tax category. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        # The tax rate as a percentage (e.g., '21.00', '6.00', '0.00')
        sig { returns(T.nilable(String)) }
        attr_accessor :rate

        sig do
          params(amount: T.nilable(String), rate: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The tax amount for this tax category. Must be rounded to maximum 2 decimals
          amount: nil,
          # The tax rate as a percentage (e.g., '21.00', '6.00', '0.00')
          rate: nil
        )
        end

        sig do
          override.returns(
            { amount: T.nilable(String), rate: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      module Vatex
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VATEX_EU_79_C =
          T.let(
            :"VATEX-EU-79-C",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132 =
          T.let(
            :"VATEX-EU-132",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_A =
          T.let(
            :"VATEX-EU-132-1A",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_B =
          T.let(
            :"VATEX-EU-132-1B",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_C =
          T.let(
            :"VATEX-EU-132-1C",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_D =
          T.let(
            :"VATEX-EU-132-1D",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_E =
          T.let(
            :"VATEX-EU-132-1E",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_F =
          T.let(
            :"VATEX-EU-132-1F",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_G =
          T.let(
            :"VATEX-EU-132-1G",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_H =
          T.let(
            :"VATEX-EU-132-1H",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_I =
          T.let(
            :"VATEX-EU-132-1I",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_J =
          T.let(
            :"VATEX-EU-132-1J",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_K =
          T.let(
            :"VATEX-EU-132-1K",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_L =
          T.let(
            :"VATEX-EU-132-1L",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_M =
          T.let(
            :"VATEX-EU-132-1M",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_N =
          T.let(
            :"VATEX-EU-132-1N",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_O =
          T.let(
            :"VATEX-EU-132-1O",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_P =
          T.let(
            :"VATEX-EU-132-1P",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_Q =
          T.let(
            :"VATEX-EU-132-1Q",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143 =
          T.let(
            :"VATEX-EU-143",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_A =
          T.let(
            :"VATEX-EU-143-1A",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_B =
          T.let(
            :"VATEX-EU-143-1B",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_C =
          T.let(
            :"VATEX-EU-143-1C",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_D =
          T.let(
            :"VATEX-EU-143-1D",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_E =
          T.let(
            :"VATEX-EU-143-1E",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_F =
          T.let(
            :"VATEX-EU-143-1F",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_FA =
          T.let(
            :"VATEX-EU-143-1FA",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_G =
          T.let(
            :"VATEX-EU-143-1G",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_H =
          T.let(
            :"VATEX-EU-143-1H",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_I =
          T.let(
            :"VATEX-EU-143-1I",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_J =
          T.let(
            :"VATEX-EU-143-1J",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_K =
          T.let(
            :"VATEX-EU-143-1K",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_L =
          T.let(
            :"VATEX-EU-143-1L",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_144 =
          T.let(
            :"VATEX-EU-144",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_146_1_E =
          T.let(
            :"VATEX-EU-146-1E",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148 =
          T.let(
            :"VATEX-EU-148",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_A =
          T.let(
            :"VATEX-EU-148-A",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_B =
          T.let(
            :"VATEX-EU-148-B",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_C =
          T.let(
            :"VATEX-EU-148-C",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_D =
          T.let(
            :"VATEX-EU-148-D",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_E =
          T.let(
            :"VATEX-EU-148-E",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_F =
          T.let(
            :"VATEX-EU-148-F",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_G =
          T.let(
            :"VATEX-EU-148-G",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151 =
          T.let(
            :"VATEX-EU-151",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_A =
          T.let(
            :"VATEX-EU-151-1A",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_AA =
          T.let(
            :"VATEX-EU-151-1AA",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_B =
          T.let(
            :"VATEX-EU-151-1B",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_C =
          T.let(
            :"VATEX-EU-151-1C",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_D =
          T.let(
            :"VATEX-EU-151-1D",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_E =
          T.let(
            :"VATEX-EU-151-1E",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_159 =
          T.let(
            :"VATEX-EU-159",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_309 =
          T.let(
            :"VATEX-EU-309",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_AE =
          T.let(
            :"VATEX-EU-AE",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_D =
          T.let(
            :"VATEX-EU-D",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_F =
          T.let(
            :"VATEX-EU-F",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_G =
          T.let(
            :"VATEX-EU-G",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_I =
          T.let(
            :"VATEX-EU-I",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_IC =
          T.let(
            :"VATEX-EU-IC",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_O =
          T.let(
            :"VATEX-EU-O",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_J =
          T.let(
            :"VATEX-EU-J",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_FR_FRANCHISE =
          T.let(
            :"VATEX-FR-FRANCHISE",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )
        VATEX_FR_CNWVAT =
          T.let(
            :"VATEX-FR-CNWVAT",
            EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::Models::DocumentCreateFromPdfResponse::Vatex::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
