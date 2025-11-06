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

      # The amount due of the invoice. Must be positive and rounded to maximum 2
      # decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount_due

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate]))
      end
      attr_accessor :attachments

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

      sig { returns(T.nilable(T::Array[EInvoiceAPI::Charge])) }
      attr_accessor :charges

      # Currency of the invoice
      sig { returns(T.nilable(EInvoiceAPI::CurrencyCode::TaggedSymbol)) }
      attr_reader :currency

      sig { params(currency: EInvoiceAPI::CurrencyCode::OrSymbol).void }
      attr_writer :currency

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_address

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_address_recipient

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_email

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_id

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_name

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_tax_id

      sig { returns(T.nilable(EInvoiceAPI::DocumentDirection::TaggedSymbol)) }
      attr_reader :direction

      sig { params(direction: EInvoiceAPI::DocumentDirection::OrSymbol).void }
      attr_writer :direction

      sig { returns(T.nilable(EInvoiceAPI::DocumentType::TaggedSymbol)) }
      attr_reader :document_type

      sig { params(document_type: EInvoiceAPI::DocumentType::OrSymbol).void }
      attr_writer :document_type

      sig { returns(T.nilable(Date)) }
      attr_accessor :due_date

      sig { returns(T.nilable(Date)) }
      attr_accessor :invoice_date

      sig { returns(T.nilable(String)) }
      attr_accessor :invoice_id

      # The total amount of the invoice (so invoice_total = subtotal + total_tax +
      # total_discount). Must be positive and rounded to maximum 2 decimals
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

      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig { returns(T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate])) }
      attr_accessor :payment_details

      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

      # The previous unpaid balance of the invoice, if any. Must be positive and rounded
      # to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :previous_unpaid_balance

      sig { returns(T.nilable(String)) }
      attr_accessor :purchase_order

      sig { returns(T.nilable(String)) }
      attr_accessor :remittance_address

      sig { returns(T.nilable(String)) }
      attr_accessor :remittance_address_recipient

      sig { returns(T.nilable(String)) }
      attr_accessor :service_address

      sig { returns(T.nilable(String)) }
      attr_accessor :service_address_recipient

      sig { returns(T.nilable(Date)) }
      attr_accessor :service_end_date

      sig { returns(T.nilable(Date)) }
      attr_accessor :service_start_date

      sig { returns(T.nilable(String)) }
      attr_accessor :shipping_address

      sig { returns(T.nilable(String)) }
      attr_accessor :shipping_address_recipient

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

      # Tax category code of the invoice
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

      # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
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

      # VAT exemption note of the invoice
      sig { returns(T.nilable(String)) }
      attr_accessor :vatex_note

      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_address

      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_address_recipient

      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_email

      sig { returns(T.nilable(String)) }
      attr_accessor :vendor_name

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
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        allowances: nil,
        # The amount due of the invoice. Must be positive and rounded to maximum 2
        # decimals
        amount_due: nil,
        attachments: nil,
        billing_address: nil,
        billing_address_recipient: nil,
        charges: nil,
        # Currency of the invoice
        currency: nil,
        customer_address: nil,
        customer_address_recipient: nil,
        customer_email: nil,
        customer_id: nil,
        customer_name: nil,
        customer_tax_id: nil,
        direction: nil,
        document_type: nil,
        due_date: nil,
        invoice_date: nil,
        invoice_id: nil,
        # The total amount of the invoice (so invoice_total = subtotal + total_tax +
        # total_discount). Must be positive and rounded to maximum 2 decimals
        invoice_total: nil,
        # At least one line item is required
        items: nil,
        note: nil,
        payment_details: nil,
        payment_term: nil,
        # The previous unpaid balance of the invoice, if any. Must be positive and rounded
        # to maximum 2 decimals
        previous_unpaid_balance: nil,
        purchase_order: nil,
        remittance_address: nil,
        remittance_address_recipient: nil,
        service_address: nil,
        service_address_recipient: nil,
        service_end_date: nil,
        service_start_date: nil,
        shipping_address: nil,
        shipping_address_recipient: nil,
        state: nil,
        # The taxable base of the invoice. Should be the sum of all line items -
        # allowances (for example commercial discounts) + charges with impact on VAT. Must
        # be positive and rounded to maximum 2 decimals
        subtotal: nil,
        # Whether the PDF was successfully converted into a compliant e-invoice
        success: nil,
        # Tax category code of the invoice
        tax_code: nil,
        tax_details: nil,
        # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
        # allowances). Can be positive (net charge), negative (net discount), or zero.
        # Must be rounded to maximum 2 decimals
        total_discount: nil,
        # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
        total_tax: nil,
        # The UBL document as an XML string
        ubl_document: nil,
        # VATEX code list for VAT exemption reasons
        #
        # Agency: CEF Identifier: vatex
        vatex: nil,
        # VAT exemption note of the invoice
        vatex_note: nil,
        vendor_address: nil,
        vendor_address_recipient: nil,
        vendor_email: nil,
        vendor_name: nil,
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

      # Tax category code of the invoice
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

        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        sig { returns(T.nilable(String)) }
        attr_accessor :rate

        sig do
          params(amount: T.nilable(String), rate: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(amount: nil, rate: nil)
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
