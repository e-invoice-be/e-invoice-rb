# typed: strong

module EInvoiceAPI
  module Models
    class DocumentCreate < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::DocumentCreate, EInvoiceAPI::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Allowance]))
      end
      attr_accessor :allowances

      # The amount due for payment. Must be positive and rounded to maximum 2 decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::AmountDue::Variants))
      end
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

      sig { returns(T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Charge])) }
      attr_accessor :charges

      # Currency of the invoice (ISO 4217 currency code)
      sig { returns(T.nilable(EInvoiceAPI::CurrencyCode::OrSymbol)) }
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
      sig { returns(T.nilable(EInvoiceAPI::DocumentDirection::OrSymbol)) }
      attr_reader :direction

      sig { params(direction: EInvoiceAPI::DocumentDirection::OrSymbol).void }
      attr_writer :direction

      # The type of document: INVOICE, CREDIT_NOTE, or DEBIT_NOTE
      sig { returns(T.nilable(EInvoiceAPI::DocumentType::OrSymbol)) }
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
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::InvoiceTotal::Variants))
      end
      attr_accessor :invoice_total

      # At least one line item is required
      sig { returns(T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Item])) }
      attr_reader :items

      sig do
        params(items: T::Array[EInvoiceAPI::DocumentCreate::Item::OrHash]).void
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
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
          )
        )
      end
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
      sig { returns(T.nilable(EInvoiceAPI::DocumentState::OrSymbol)) }
      attr_reader :state

      sig { params(state: EInvoiceAPI::DocumentState::OrSymbol).void }
      attr_writer :state

      # The taxable base of the invoice. Should be the sum of all line items -
      # allowances (for example commercial discounts) + charges with impact on VAT. Must
      # be positive and rounded to maximum 2 decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::Subtotal::Variants))
      end
      attr_accessor :subtotal

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
      sig { returns(T.nilable(EInvoiceAPI::DocumentCreate::TaxCode::OrSymbol)) }
      attr_reader :tax_code

      sig do
        params(tax_code: EInvoiceAPI::DocumentCreate::TaxCode::OrSymbol).void
      end
      attr_writer :tax_code

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentCreate::TaxDetail]))
      end
      attr_accessor :tax_details

      # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      # allowances). Can be positive (net charge), negative (net discount), or zero.
      # Must be rounded to maximum 2 decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::TotalDiscount::Variants))
      end
      attr_accessor :total_discount

      # The total tax amount of the invoice. Must be positive and rounded to maximum 2
      # decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::TotalTax::Variants))
      end
      attr_accessor :total_tax

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      sig { returns(T.nilable(EInvoiceAPI::DocumentCreate::Vatex::OrSymbol)) }
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
          allowances:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Allowance::OrHash]),
          amount_due:
            T.nilable(EInvoiceAPI::DocumentCreate::AmountDue::Variants),
          attachments:
            T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate::OrHash]),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          charges:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Charge::OrHash]),
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
          invoice_total:
            T.nilable(EInvoiceAPI::DocumentCreate::InvoiceTotal::Variants),
          items: T::Array[EInvoiceAPI::DocumentCreate::Item::OrHash],
          note: T.nilable(String),
          payment_details:
            T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate::OrHash]),
          payment_term: T.nilable(String),
          previous_unpaid_balance:
            T.nilable(
              EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
            ),
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
          subtotal: T.nilable(EInvoiceAPI::DocumentCreate::Subtotal::Variants),
          tax_code: EInvoiceAPI::DocumentCreate::TaxCode::OrSymbol,
          tax_details:
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::TaxDetail::OrHash]),
          total_discount:
            T.nilable(EInvoiceAPI::DocumentCreate::TotalDiscount::Variants),
          total_tax: T.nilable(EInvoiceAPI::DocumentCreate::TotalTax::Variants),
          vatex: T.nilable(EInvoiceAPI::DocumentCreate::Vatex::OrSymbol),
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
            allowances:
              T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Allowance]),
            amount_due:
              T.nilable(EInvoiceAPI::DocumentCreate::AmountDue::Variants),
            attachments:
              T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate]),
            billing_address: T.nilable(String),
            billing_address_recipient: T.nilable(String),
            charges: T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Charge]),
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
            invoice_total:
              T.nilable(EInvoiceAPI::DocumentCreate::InvoiceTotal::Variants),
            items: T::Array[EInvoiceAPI::DocumentCreate::Item],
            note: T.nilable(String),
            payment_details:
              T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate]),
            payment_term: T.nilable(String),
            previous_unpaid_balance:
              T.nilable(
                EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
              ),
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
            subtotal:
              T.nilable(EInvoiceAPI::DocumentCreate::Subtotal::Variants),
            tax_code: EInvoiceAPI::DocumentCreate::TaxCode::OrSymbol,
            tax_details:
              T.nilable(T::Array[EInvoiceAPI::DocumentCreate::TaxDetail]),
            total_discount:
              T.nilable(EInvoiceAPI::DocumentCreate::TotalDiscount::Variants),
            total_tax:
              T.nilable(EInvoiceAPI::DocumentCreate::TotalTax::Variants),
            vatex: T.nilable(EInvoiceAPI::DocumentCreate::Vatex::OrSymbol),
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

      class Allowance < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentCreate::Allowance,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Allowance::Amount::Variants)
          )
        end
        attr_accessor :amount

        # The base amount that may be used, in conjunction with the allowance percentage,
        # to calculate the allowance amount. Must be rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentCreate::Allowance::BaseAmount::Variants
            )
          )
        end
        attr_accessor :base_amount

        # The percentage that may be used, in conjunction with the allowance base amount,
        # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
        # to maximum 2 decimals
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentCreate::Allowance::MultiplierFactor::Variants
            )
          )
        end
        attr_accessor :multiplier_factor

        # The reason for the allowance
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Allowance reason codes for invoice discounts and charges
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::OrSymbol
            )
          )
        end
        attr_accessor :reason_code

        # The VAT category code that applies to the allowance
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol)
          )
        end
        attr_reader :tax_code

        sig do
          params(
            tax_code: EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol
          ).void
        end
        attr_writer :tax_code

        # The VAT rate, represented as percentage that applies to the allowance. Must be
        # rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Allowance::TaxRate::Variants)
          )
        end
        attr_accessor :tax_rate

        # An allowance is a discount for example for early payment, volume discount, etc.
        sig do
          params(
            amount:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::Amount::Variants
              ),
            base_amount:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::BaseAmount::Variants
              ),
            multiplier_factor:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::MultiplierFactor::Variants
              ),
            reason: T.nilable(String),
            reason_code:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::OrSymbol
              ),
            tax_code: EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol,
            tax_rate:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::TaxRate::Variants
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
          amount: nil,
          # The base amount that may be used, in conjunction with the allowance percentage,
          # to calculate the allowance amount. Must be rounded to maximum 2 decimals
          base_amount: nil,
          # The percentage that may be used, in conjunction with the allowance base amount,
          # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
          # to maximum 2 decimals
          multiplier_factor: nil,
          # The reason for the allowance
          reason: nil,
          # Allowance reason codes for invoice discounts and charges
          reason_code: nil,
          # The VAT category code that applies to the allowance
          tax_code: nil,
          # The VAT rate, represented as percentage that applies to the allowance. Must be
          # rounded to maximum 2 decimals
          tax_rate: nil
        )
        end

        sig do
          override.returns(
            {
              amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::Amount::Variants
                ),
              base_amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::BaseAmount::Variants
                ),
              multiplier_factor:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::MultiplierFactor::Variants
                ),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::OrSymbol
                ),
              tax_code:
                EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol,
              tax_rate:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::TaxRate::Variants
                )
            }
          )
        end
        def to_hash
        end

        # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Allowance::Amount::Variants]
            )
          end
          def self.variants
          end
        end

        # The base amount that may be used, in conjunction with the allowance percentage,
        # to calculate the allowance amount. Must be rounded to maximum 2 decimals
        module BaseAmount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Allowance::BaseAmount::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # The percentage that may be used, in conjunction with the allowance base amount,
        # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
        # to maximum 2 decimals
        module MultiplierFactor
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Allowance::MultiplierFactor::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Allowance reason codes for invoice discounts and charges
        module ReasonCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::DocumentCreate::Allowance::ReasonCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REASON_CODE_41 =
            T.let(
              :"41",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_42 =
            T.let(
              :"42",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_60 =
            T.let(
              :"60",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_62 =
            T.let(
              :"62",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_63 =
            T.let(
              :"63",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_64 =
            T.let(
              :"64",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_65 =
            T.let(
              :"65",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_66 =
            T.let(
              :"66",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_67 =
            T.let(
              :"67",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_68 =
            T.let(
              :"68",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_70 =
            T.let(
              :"70",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_71 =
            T.let(
              :"71",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_88 =
            T.let(
              :"88",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_95 =
            T.let(
              :"95",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_100 =
            T.let(
              :"100",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_102 =
            T.let(
              :"102",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_103 =
            T.let(
              :"103",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_104 =
            T.let(
              :"104",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_105 =
            T.let(
              :"105",
              EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Allowance::ReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The VAT category code that applies to the allowance
        module TaxCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::DocumentCreate::Allowance::TaxCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AE =
            T.let(
              :AE,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          E =
            T.let(
              :E,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          S =
            T.let(
              :S,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          Z =
            T.let(
              :Z,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          G =
            T.let(
              :G,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          O =
            T.let(
              :O,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          K =
            T.let(
              :K,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          L =
            T.let(
              :L,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          M =
            T.let(
              :M,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )
          B =
            T.let(
              :B,
              EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Allowance::TaxCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The VAT rate, represented as percentage that applies to the allowance. Must be
        # rounded to maximum 2 decimals
        module TaxRate
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Allowance::TaxRate::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end

      # The amount due for payment. Must be positive and rounded to maximum 2 decimals
      module AmountDue
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::AmountDue::Variants]
          )
        end
        def self.variants
        end
      end

      class Charge < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentCreate::Charge,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The charge amount, without VAT. Must be rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Charge::Amount::Variants)
          )
        end
        attr_accessor :amount

        # The base amount that may be used, in conjunction with the charge percentage, to
        # calculate the charge amount. Must be rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Charge::BaseAmount::Variants)
          )
        end
        attr_accessor :base_amount

        # The percentage that may be used, in conjunction with the charge base amount, to
        # calculate the charge amount. To state 20%, use value 20
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentCreate::Charge::MultiplierFactor::Variants
            )
          )
        end
        attr_accessor :multiplier_factor

        # The reason for the charge
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Charge reason codes for invoice charges and fees
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Charge::ReasonCode::OrSymbol)
          )
        end
        attr_accessor :reason_code

        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Charge::TaxCode::OrSymbol)
          )
        end
        attr_accessor :tax_code

        # The VAT rate, represented as percentage that applies to the charge
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Charge::TaxRate::Variants)
          )
        end
        attr_accessor :tax_rate

        # A charge is an additional fee for example for late payment, late delivery, etc.
        sig do
          params(
            amount:
              T.nilable(EInvoiceAPI::DocumentCreate::Charge::Amount::Variants),
            base_amount:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Charge::BaseAmount::Variants
              ),
            multiplier_factor:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Charge::MultiplierFactor::Variants
              ),
            reason: T.nilable(String),
            reason_code:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Charge::ReasonCode::OrSymbol
              ),
            tax_code:
              T.nilable(EInvoiceAPI::DocumentCreate::Charge::TaxCode::OrSymbol),
            tax_rate:
              T.nilable(EInvoiceAPI::DocumentCreate::Charge::TaxRate::Variants)
          ).returns(T.attached_class)
        end
        def self.new(
          # The charge amount, without VAT. Must be rounded to maximum 2 decimals
          amount: nil,
          # The base amount that may be used, in conjunction with the charge percentage, to
          # calculate the charge amount. Must be rounded to maximum 2 decimals
          base_amount: nil,
          # The percentage that may be used, in conjunction with the charge base amount, to
          # calculate the charge amount. To state 20%, use value 20
          multiplier_factor: nil,
          # The reason for the charge
          reason: nil,
          # Charge reason codes for invoice charges and fees
          reason_code: nil,
          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
          tax_code: nil,
          # The VAT rate, represented as percentage that applies to the charge
          tax_rate: nil
        )
        end

        sig do
          override.returns(
            {
              amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::Amount::Variants
                ),
              base_amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::BaseAmount::Variants
                ),
              multiplier_factor:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::MultiplierFactor::Variants
                ),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::ReasonCode::OrSymbol
                ),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::TaxCode::OrSymbol
                ),
              tax_rate:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::TaxRate::Variants
                )
            }
          )
        end
        def to_hash
        end

        # The charge amount, without VAT. Must be rounded to maximum 2 decimals
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Charge::Amount::Variants]
            )
          end
          def self.variants
          end
        end

        # The base amount that may be used, in conjunction with the charge percentage, to
        # calculate the charge amount. Must be rounded to maximum 2 decimals
        module BaseAmount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Charge::BaseAmount::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # The percentage that may be used, in conjunction with the charge base amount, to
        # calculate the charge amount. To state 20%, use value 20
        module MultiplierFactor
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Charge::MultiplierFactor::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Charge reason codes for invoice charges and fees
        module ReasonCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::DocumentCreate::Charge::ReasonCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AA =
            T.let(
              :AA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAA =
            T.let(
              :AAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAC =
            T.let(
              :AAC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAD =
            T.let(
              :AAD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAE =
            T.let(
              :AAE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAF =
            T.let(
              :AAF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAH =
            T.let(
              :AAH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAI =
            T.let(
              :AAI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAS =
            T.let(
              :AAS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAT =
            T.let(
              :AAT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAV =
            T.let(
              :AAV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAY =
            T.let(
              :AAY,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AAZ =
            T.let(
              :AAZ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABA =
            T.let(
              :ABA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABB =
            T.let(
              :ABB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABC =
            T.let(
              :ABC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABD =
            T.let(
              :ABD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABF =
            T.let(
              :ABF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABK =
            T.let(
              :ABK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABL =
            T.let(
              :ABL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABN =
            T.let(
              :ABN,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABR =
            T.let(
              :ABR,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABS =
            T.let(
              :ABS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABT =
            T.let(
              :ABT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ABU =
            T.let(
              :ABU,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACF =
            T.let(
              :ACF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACG =
            T.let(
              :ACG,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACH =
            T.let(
              :ACH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACI =
            T.let(
              :ACI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACJ =
            T.let(
              :ACJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACK =
            T.let(
              :ACK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACL =
            T.let(
              :ACL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACM =
            T.let(
              :ACM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ACS =
            T.let(
              :ACS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADC =
            T.let(
              :ADC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADE =
            T.let(
              :ADE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADJ =
            T.let(
              :ADJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADK =
            T.let(
              :ADK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADL =
            T.let(
              :ADL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADM =
            T.let(
              :ADM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADN =
            T.let(
              :ADN,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADO =
            T.let(
              :ADO,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADP =
            T.let(
              :ADP,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADQ =
            T.let(
              :ADQ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADR =
            T.let(
              :ADR,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADT =
            T.let(
              :ADT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADW =
            T.let(
              :ADW,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADY =
            T.let(
              :ADY,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ADZ =
            T.let(
              :ADZ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEA =
            T.let(
              :AEA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEB =
            T.let(
              :AEB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEC =
            T.let(
              :AEC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AED =
            T.let(
              :AED,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEF =
            T.let(
              :AEF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEH =
            T.let(
              :AEH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEI =
            T.let(
              :AEI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEJ =
            T.let(
              :AEJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEK =
            T.let(
              :AEK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEL =
            T.let(
              :AEL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEM =
            T.let(
              :AEM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEN =
            T.let(
              :AEN,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEO =
            T.let(
              :AEO,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEP =
            T.let(
              :AEP,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AES =
            T.let(
              :AES,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AET =
            T.let(
              :AET,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEU =
            T.let(
              :AEU,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEV =
            T.let(
              :AEV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEW =
            T.let(
              :AEW,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEX =
            T.let(
              :AEX,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEY =
            T.let(
              :AEY,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AEZ =
            T.let(
              :AEZ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AJ =
            T.let(
              :AJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          AU =
            T.let(
              :AU,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CA =
            T.let(
              :CA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAB =
            T.let(
              :CAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAD =
            T.let(
              :CAD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAE =
            T.let(
              :CAE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAF =
            T.let(
              :CAF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAI =
            T.let(
              :CAI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAJ =
            T.let(
              :CAJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAK =
            T.let(
              :CAK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAL =
            T.let(
              :CAL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAM =
            T.let(
              :CAM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAN =
            T.let(
              :CAN,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAO =
            T.let(
              :CAO,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAP =
            T.let(
              :CAP,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAQ =
            T.let(
              :CAQ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAR =
            T.let(
              :CAR,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAS =
            T.let(
              :CAS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAT =
            T.let(
              :CAT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAU =
            T.let(
              :CAU,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAV =
            T.let(
              :CAV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAW =
            T.let(
              :CAW,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAX =
            T.let(
              :CAX,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAY =
            T.let(
              :CAY,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CAZ =
            T.let(
              :CAZ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CD =
            T.let(
              :CD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CG =
            T.let(
              :CG,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CS =
            T.let(
              :CS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          CT =
            T.let(
              :CT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAB =
            T.let(
              :DAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAC =
            T.let(
              :DAC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAD =
            T.let(
              :DAD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAF =
            T.let(
              :DAF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAG =
            T.let(
              :DAG,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAH =
            T.let(
              :DAH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAI =
            T.let(
              :DAI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAJ =
            T.let(
              :DAJ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAK =
            T.let(
              :DAK,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAL =
            T.let(
              :DAL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAM =
            T.let(
              :DAM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAN =
            T.let(
              :DAN,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAO =
            T.let(
              :DAO,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAP =
            T.let(
              :DAP,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DAQ =
            T.let(
              :DAQ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          DL =
            T.let(
              :DL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          EG =
            T.let(
              :EG,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          EP =
            T.let(
              :EP,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ER =
            T.let(
              :ER,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FAA =
            T.let(
              :FAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FAB =
            T.let(
              :FAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FAC =
            T.let(
              :FAC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FC =
            T.let(
              :FC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FH =
            T.let(
              :FH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          FI =
            T.let(
              :FI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          GAA =
            T.let(
              :GAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          HAA =
            T.let(
              :HAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          HD =
            T.let(
              :HD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          HH =
            T.let(
              :HH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          IAA =
            T.let(
              :IAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          IAB =
            T.let(
              :IAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ID =
            T.let(
              :ID,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          IF =
            T.let(
              :IF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          IR =
            T.let(
              :IR,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          IS =
            T.let(
              :IS,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          KO =
            T.let(
              :KO,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          L1 =
            T.let(
              :L1,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          LA =
            T.let(
              :LA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          LAA =
            T.let(
              :LAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          LAB =
            T.let(
              :LAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          LF =
            T.let(
              :LF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          MAE =
            T.let(
              :MAE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          MI =
            T.let(
              :MI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ML =
            T.let(
              :ML,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          NAA =
            T.let(
              :NAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          OA =
            T.let(
              :OA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          PA =
            T.let(
              :PA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          PAA =
            T.let(
              :PAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          PC =
            T.let(
              :PC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          PL =
            T.let(
              :PL,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          PRV =
            T.let(
              :PRV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RAB =
            T.let(
              :RAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RAC =
            T.let(
              :RAC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RAD =
            T.let(
              :RAD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RAF =
            T.let(
              :RAF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RE =
            T.let(
              :RE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RF =
            T.let(
              :RF,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RH =
            T.let(
              :RH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          RV =
            T.let(
              :RV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SA =
            T.let(
              :SA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SAA =
            T.let(
              :SAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SAD =
            T.let(
              :SAD,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SAE =
            T.let(
              :SAE,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SAI =
            T.let(
              :SAI,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SG =
            T.let(
              :SG,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SH =
            T.let(
              :SH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SM =
            T.let(
              :SM,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          SU =
            T.let(
              :SU,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          TAB =
            T.let(
              :TAB,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          TAC =
            T.let(
              :TAC,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          TT =
            T.let(
              :TT,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          TV =
            T.let(
              :TV,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          V1 =
            T.let(
              :V1,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          V2 =
            T.let(
              :V2,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          WH =
            T.let(
              :WH,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          XAA =
            T.let(
              :XAA,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          YY =
            T.let(
              :YY,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )
          ZZZ =
            T.let(
              :ZZZ,
              EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Charge::ReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        module TaxCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::DocumentCreate::Charge::TaxCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AE =
            T.let(
              :AE,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          E =
            T.let(
              :E,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          S =
            T.let(
              :S,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          Z =
            T.let(
              :Z,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          G =
            T.let(
              :G,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          O =
            T.let(
              :O,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          K =
            T.let(
              :K,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          L =
            T.let(
              :L,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          M =
            T.let(
              :M,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )
          B =
            T.let(
              :B,
              EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentCreate::Charge::TaxCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The VAT rate, represented as percentage that applies to the charge
        module TaxRate
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Charge::TaxRate::Variants]
            )
          end
          def self.variants
          end
        end
      end

      # The total amount of the invoice including tax (invoice_total = subtotal +
      # total_tax + total_discount). Must be positive and rounded to maximum 2 decimals
      module InvoiceTotal
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::InvoiceTotal::Variants]
          )
        end
        def self.variants
        end
      end

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentCreate::Item,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The allowances of the line item.
        sig do
          returns(
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Item::Allowance])
          )
        end
        attr_accessor :allowances

        # The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
        # allowances and charges. Calculated as: ((unit_price / price_base_quantity) \*
        # quantity) - allowances + charges. Must be rounded to maximum 2 decimals. Can be
        # negative for credit notes or corrections.
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Item::Amount::Variants)
          )
        end
        attr_accessor :amount

        # The charges of the line item.
        sig do
          returns(
            T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Item::Charge])
          )
        end
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
        # Must be rounded to maximum 4 decimals. Can be negative for credit notes or
        # corrections.
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Item::Quantity::Variants)
          )
        end
        attr_accessor :quantity

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals.
        # Can be negative for credit notes or corrections.
        sig do
          returns(T.nilable(EInvoiceAPI::DocumentCreate::Item::Tax::Variants))
        end
        attr_accessor :tax

        # The VAT rate of the line item expressed as percentage with 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Item::TaxRate::Variants)
          )
        end
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol)) }
        attr_accessor :unit

        # The item net price (BT-146). The price of an item, exclusive of VAT, after
        # subtracting item price discount. Must be rounded to maximum 4 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Item::UnitPrice::Variants)
          )
        end
        attr_accessor :unit_price

        sig do
          params(
            allowances:
              T.nilable(
                T::Array[EInvoiceAPI::DocumentCreate::Item::Allowance::OrHash]
              ),
            amount:
              T.nilable(EInvoiceAPI::DocumentCreate::Item::Amount::Variants),
            charges:
              T.nilable(
                T::Array[EInvoiceAPI::DocumentCreate::Item::Charge::OrHash]
              ),
            date: NilClass,
            description: T.nilable(String),
            product_code: T.nilable(String),
            quantity:
              T.nilable(EInvoiceAPI::DocumentCreate::Item::Quantity::Variants),
            tax: T.nilable(EInvoiceAPI::DocumentCreate::Item::Tax::Variants),
            tax_rate:
              T.nilable(EInvoiceAPI::DocumentCreate::Item::TaxRate::Variants),
            unit: T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol),
            unit_price:
              T.nilable(EInvoiceAPI::DocumentCreate::Item::UnitPrice::Variants)
          ).returns(T.attached_class)
        end
        def self.new(
          # The allowances of the line item.
          allowances: nil,
          # The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
          # allowances and charges. Calculated as: ((unit_price / price_base_quantity) \*
          # quantity) - allowances + charges. Must be rounded to maximum 2 decimals. Can be
          # negative for credit notes or corrections.
          amount: nil,
          # The charges of the line item.
          charges: nil,
          date: nil,
          # The description of the line item.
          description: nil,
          # The product code of the line item.
          product_code: nil,
          # The quantity of items (goods or services) that is the subject of the line item.
          # Must be rounded to maximum 4 decimals. Can be negative for credit notes or
          # corrections.
          quantity: nil,
          # The total VAT amount for the line item. Must be rounded to maximum 2 decimals.
          # Can be negative for credit notes or corrections.
          tax: nil,
          # The VAT rate of the line item expressed as percentage with 2 decimals
          tax_rate: nil,
          # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
          unit: nil,
          # The item net price (BT-146). The price of an item, exclusive of VAT, after
          # subtracting item price discount. Must be rounded to maximum 4 decimals
          unit_price: nil
        )
        end

        sig do
          override.returns(
            {
              allowances:
                T.nilable(
                  T::Array[EInvoiceAPI::DocumentCreate::Item::Allowance]
                ),
              amount:
                T.nilable(EInvoiceAPI::DocumentCreate::Item::Amount::Variants),
              charges:
                T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Item::Charge]),
              date: NilClass,
              description: T.nilable(String),
              product_code: T.nilable(String),
              quantity:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Quantity::Variants
                ),
              tax: T.nilable(EInvoiceAPI::DocumentCreate::Item::Tax::Variants),
              tax_rate:
                T.nilable(EInvoiceAPI::DocumentCreate::Item::TaxRate::Variants),
              unit: T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol),
              unit_price:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::UnitPrice::Variants
                )
            }
          )
        end
        def to_hash
        end

        class Allowance < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::DocumentCreate::Item::Allowance,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::Amount::Variants
              )
            )
          end
          attr_accessor :amount

          # The base amount that may be used, in conjunction with the allowance percentage,
          # to calculate the allowance amount. Must be rounded to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::BaseAmount::Variants
              )
            )
          end
          attr_accessor :base_amount

          # The percentage that may be used, in conjunction with the allowance base amount,
          # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
          # to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::MultiplierFactor::Variants
              )
            )
          end
          attr_accessor :multiplier_factor

          # The reason for the allowance
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # Allowance reason codes for invoice discounts and charges
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::OrSymbol
              )
            )
          end
          attr_accessor :reason_code

          # The VAT category code that applies to the allowance
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol
              )
            )
          end
          attr_reader :tax_code

          sig do
            params(
              tax_code:
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol
            ).void
          end
          attr_writer :tax_code

          # The VAT rate, represented as percentage that applies to the allowance. Must be
          # rounded to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxRate::Variants
              )
            )
          end
          attr_accessor :tax_rate

          # An allowance is a discount for example for early payment, volume discount, etc.
          sig do
            params(
              amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::Amount::Variants
                ),
              base_amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::BaseAmount::Variants
                ),
              multiplier_factor:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::MultiplierFactor::Variants
                ),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::OrSymbol
                ),
              tax_code:
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol,
              tax_rate:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxRate::Variants
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
            amount: nil,
            # The base amount that may be used, in conjunction with the allowance percentage,
            # to calculate the allowance amount. Must be rounded to maximum 2 decimals
            base_amount: nil,
            # The percentage that may be used, in conjunction with the allowance base amount,
            # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
            # to maximum 2 decimals
            multiplier_factor: nil,
            # The reason for the allowance
            reason: nil,
            # Allowance reason codes for invoice discounts and charges
            reason_code: nil,
            # The VAT category code that applies to the allowance
            tax_code: nil,
            # The VAT rate, represented as percentage that applies to the allowance. Must be
            # rounded to maximum 2 decimals
            tax_rate: nil
          )
          end

          sig do
            override.returns(
              {
                amount:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::Amount::Variants
                  ),
                base_amount:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::BaseAmount::Variants
                  ),
                multiplier_factor:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::MultiplierFactor::Variants
                  ),
                reason: T.nilable(String),
                reason_code:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::OrSymbol
                  ),
                tax_code:
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol,
                tax_rate:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::TaxRate::Variants
                  )
              }
            )
          end
          def to_hash
          end

          # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
          module Amount
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::Amount::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # The base amount that may be used, in conjunction with the allowance percentage,
          # to calculate the allowance amount. Must be rounded to maximum 2 decimals
          module BaseAmount
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::BaseAmount::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # The percentage that may be used, in conjunction with the allowance base amount,
          # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
          # to maximum 2 decimals
          module MultiplierFactor
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::MultiplierFactor::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Allowance reason codes for invoice discounts and charges
          module ReasonCode
            extend EInvoiceAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REASON_CODE_41 =
              T.let(
                :"41",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_42 =
              T.let(
                :"42",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_60 =
              T.let(
                :"60",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_62 =
              T.let(
                :"62",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_63 =
              T.let(
                :"63",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_64 =
              T.let(
                :"64",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_65 =
              T.let(
                :"65",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_66 =
              T.let(
                :"66",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_67 =
              T.let(
                :"67",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_68 =
              T.let(
                :"68",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_70 =
              T.let(
                :"70",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_71 =
              T.let(
                :"71",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_88 =
              T.let(
                :"88",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_95 =
              T.let(
                :"95",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_100 =
              T.let(
                :"100",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_102 =
              T.let(
                :"102",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_103 =
              T.let(
                :"103",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_104 =
              T.let(
                :"104",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )
            REASON_CODE_105 =
              T.let(
                :"105",
                EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::ReasonCode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The VAT category code that applies to the allowance
          module TaxCode
            extend EInvoiceAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AE =
              T.let(
                :AE,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            E =
              T.let(
                :E,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            S =
              T.let(
                :S,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            Z =
              T.let(
                :Z,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            G =
              T.let(
                :G,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            O =
              T.let(
                :O,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            K =
              T.let(
                :K,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            L =
              T.let(
                :L,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            M =
              T.let(
                :M,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )
            B =
              T.let(
                :B,
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The VAT rate, represented as percentage that applies to the allowance. Must be
          # rounded to maximum 2 decimals
          module TaxRate
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxRate::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        # The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
        # allowances and charges. Calculated as: ((unit_price / price_base_quantity) \*
        # quantity) - allowances + charges. Must be rounded to maximum 2 decimals. Can be
        # negative for credit notes or corrections.
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Item::Amount::Variants]
            )
          end
          def self.variants
          end
        end

        class Charge < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::DocumentCreate::Item::Charge,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # The charge amount, without VAT. Must be rounded to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::Amount::Variants
              )
            )
          end
          attr_accessor :amount

          # The base amount that may be used, in conjunction with the charge percentage, to
          # calculate the charge amount. Must be rounded to maximum 2 decimals
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::BaseAmount::Variants
              )
            )
          end
          attr_accessor :base_amount

          # The percentage that may be used, in conjunction with the charge base amount, to
          # calculate the charge amount. To state 20%, use value 20
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::MultiplierFactor::Variants
              )
            )
          end
          attr_accessor :multiplier_factor

          # The reason for the charge
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # Charge reason codes for invoice charges and fees
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::OrSymbol
              )
            )
          end
          attr_accessor :reason_code

          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::OrSymbol
              )
            )
          end
          attr_accessor :tax_code

          # The VAT rate, represented as percentage that applies to the charge
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxRate::Variants
              )
            )
          end
          attr_accessor :tax_rate

          # A charge is an additional fee for example for late payment, late delivery, etc.
          sig do
            params(
              amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::Amount::Variants
                ),
              base_amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::BaseAmount::Variants
                ),
              multiplier_factor:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::MultiplierFactor::Variants
                ),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::OrSymbol
                ),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::OrSymbol
                ),
              tax_rate:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxRate::Variants
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The charge amount, without VAT. Must be rounded to maximum 2 decimals
            amount: nil,
            # The base amount that may be used, in conjunction with the charge percentage, to
            # calculate the charge amount. Must be rounded to maximum 2 decimals
            base_amount: nil,
            # The percentage that may be used, in conjunction with the charge base amount, to
            # calculate the charge amount. To state 20%, use value 20
            multiplier_factor: nil,
            # The reason for the charge
            reason: nil,
            # Charge reason codes for invoice charges and fees
            reason_code: nil,
            # Duty or tax or fee category codes (Subset of UNCL5305)
            #
            # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
            tax_code: nil,
            # The VAT rate, represented as percentage that applies to the charge
            tax_rate: nil
          )
          end

          sig do
            override.returns(
              {
                amount:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::Amount::Variants
                  ),
                base_amount:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::BaseAmount::Variants
                  ),
                multiplier_factor:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::MultiplierFactor::Variants
                  ),
                reason: T.nilable(String),
                reason_code:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::OrSymbol
                  ),
                tax_code:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::OrSymbol
                  ),
                tax_rate:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::TaxRate::Variants
                  )
              }
            )
          end
          def to_hash
          end

          # The charge amount, without VAT. Must be rounded to maximum 2 decimals
          module Amount
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::Amount::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # The base amount that may be used, in conjunction with the charge percentage, to
          # calculate the charge amount. Must be rounded to maximum 2 decimals
          module BaseAmount
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::BaseAmount::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # The percentage that may be used, in conjunction with the charge base amount, to
          # calculate the charge amount. To state 20%, use value 20
          module MultiplierFactor
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::MultiplierFactor::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Charge reason codes for invoice charges and fees
          module ReasonCode
            extend EInvoiceAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AA =
              T.let(
                :AA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAA =
              T.let(
                :AAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAC =
              T.let(
                :AAC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAD =
              T.let(
                :AAD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAE =
              T.let(
                :AAE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAF =
              T.let(
                :AAF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAH =
              T.let(
                :AAH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAI =
              T.let(
                :AAI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAS =
              T.let(
                :AAS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAT =
              T.let(
                :AAT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAV =
              T.let(
                :AAV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAY =
              T.let(
                :AAY,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AAZ =
              T.let(
                :AAZ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABA =
              T.let(
                :ABA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABB =
              T.let(
                :ABB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABC =
              T.let(
                :ABC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABD =
              T.let(
                :ABD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABF =
              T.let(
                :ABF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABK =
              T.let(
                :ABK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABL =
              T.let(
                :ABL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABN =
              T.let(
                :ABN,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABR =
              T.let(
                :ABR,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABS =
              T.let(
                :ABS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABT =
              T.let(
                :ABT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ABU =
              T.let(
                :ABU,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACF =
              T.let(
                :ACF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACG =
              T.let(
                :ACG,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACH =
              T.let(
                :ACH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACI =
              T.let(
                :ACI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACJ =
              T.let(
                :ACJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACK =
              T.let(
                :ACK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACL =
              T.let(
                :ACL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACM =
              T.let(
                :ACM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ACS =
              T.let(
                :ACS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADC =
              T.let(
                :ADC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADE =
              T.let(
                :ADE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADJ =
              T.let(
                :ADJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADK =
              T.let(
                :ADK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADL =
              T.let(
                :ADL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADM =
              T.let(
                :ADM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADN =
              T.let(
                :ADN,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADO =
              T.let(
                :ADO,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADP =
              T.let(
                :ADP,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADQ =
              T.let(
                :ADQ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADR =
              T.let(
                :ADR,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADT =
              T.let(
                :ADT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADW =
              T.let(
                :ADW,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADY =
              T.let(
                :ADY,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ADZ =
              T.let(
                :ADZ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEA =
              T.let(
                :AEA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEB =
              T.let(
                :AEB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEC =
              T.let(
                :AEC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AED =
              T.let(
                :AED,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEF =
              T.let(
                :AEF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEH =
              T.let(
                :AEH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEI =
              T.let(
                :AEI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEJ =
              T.let(
                :AEJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEK =
              T.let(
                :AEK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEL =
              T.let(
                :AEL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEM =
              T.let(
                :AEM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEN =
              T.let(
                :AEN,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEO =
              T.let(
                :AEO,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEP =
              T.let(
                :AEP,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AES =
              T.let(
                :AES,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AET =
              T.let(
                :AET,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEU =
              T.let(
                :AEU,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEV =
              T.let(
                :AEV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEW =
              T.let(
                :AEW,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEX =
              T.let(
                :AEX,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEY =
              T.let(
                :AEY,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AEZ =
              T.let(
                :AEZ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AJ =
              T.let(
                :AJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            AU =
              T.let(
                :AU,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CA =
              T.let(
                :CA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAB =
              T.let(
                :CAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAD =
              T.let(
                :CAD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAE =
              T.let(
                :CAE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAF =
              T.let(
                :CAF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAI =
              T.let(
                :CAI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAJ =
              T.let(
                :CAJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAK =
              T.let(
                :CAK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAL =
              T.let(
                :CAL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAM =
              T.let(
                :CAM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAN =
              T.let(
                :CAN,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAO =
              T.let(
                :CAO,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAP =
              T.let(
                :CAP,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAQ =
              T.let(
                :CAQ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAR =
              T.let(
                :CAR,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAS =
              T.let(
                :CAS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAT =
              T.let(
                :CAT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAU =
              T.let(
                :CAU,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAV =
              T.let(
                :CAV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAW =
              T.let(
                :CAW,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAX =
              T.let(
                :CAX,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAY =
              T.let(
                :CAY,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CAZ =
              T.let(
                :CAZ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CD =
              T.let(
                :CD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CG =
              T.let(
                :CG,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CS =
              T.let(
                :CS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            CT =
              T.let(
                :CT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAB =
              T.let(
                :DAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAC =
              T.let(
                :DAC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAD =
              T.let(
                :DAD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAF =
              T.let(
                :DAF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAG =
              T.let(
                :DAG,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAH =
              T.let(
                :DAH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAI =
              T.let(
                :DAI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAJ =
              T.let(
                :DAJ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAK =
              T.let(
                :DAK,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAL =
              T.let(
                :DAL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAM =
              T.let(
                :DAM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAN =
              T.let(
                :DAN,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAO =
              T.let(
                :DAO,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAP =
              T.let(
                :DAP,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DAQ =
              T.let(
                :DAQ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            DL =
              T.let(
                :DL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            EG =
              T.let(
                :EG,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            EP =
              T.let(
                :EP,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ER =
              T.let(
                :ER,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FAA =
              T.let(
                :FAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FAB =
              T.let(
                :FAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FAC =
              T.let(
                :FAC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FC =
              T.let(
                :FC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FH =
              T.let(
                :FH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            FI =
              T.let(
                :FI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            GAA =
              T.let(
                :GAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            HAA =
              T.let(
                :HAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            HD =
              T.let(
                :HD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            HH =
              T.let(
                :HH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            IAA =
              T.let(
                :IAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            IAB =
              T.let(
                :IAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ID =
              T.let(
                :ID,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            IF =
              T.let(
                :IF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            IR =
              T.let(
                :IR,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            IS =
              T.let(
                :IS,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            KO =
              T.let(
                :KO,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            L1 =
              T.let(
                :L1,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            LA =
              T.let(
                :LA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            LAA =
              T.let(
                :LAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            LAB =
              T.let(
                :LAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            LF =
              T.let(
                :LF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            MAE =
              T.let(
                :MAE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            MI =
              T.let(
                :MI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ML =
              T.let(
                :ML,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            NAA =
              T.let(
                :NAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            OA =
              T.let(
                :OA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            PA =
              T.let(
                :PA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            PAA =
              T.let(
                :PAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            PC =
              T.let(
                :PC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            PL =
              T.let(
                :PL,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            PRV =
              T.let(
                :PRV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RAB =
              T.let(
                :RAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RAC =
              T.let(
                :RAC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RAD =
              T.let(
                :RAD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RAF =
              T.let(
                :RAF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RE =
              T.let(
                :RE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RF =
              T.let(
                :RF,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RH =
              T.let(
                :RH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            RV =
              T.let(
                :RV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SA =
              T.let(
                :SA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SAA =
              T.let(
                :SAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SAD =
              T.let(
                :SAD,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SAE =
              T.let(
                :SAE,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SAI =
              T.let(
                :SAI,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SG =
              T.let(
                :SG,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SH =
              T.let(
                :SH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SM =
              T.let(
                :SM,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            SU =
              T.let(
                :SU,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            TAB =
              T.let(
                :TAB,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            TAC =
              T.let(
                :TAC,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            TT =
              T.let(
                :TT,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            TV =
              T.let(
                :TV,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            V1 =
              T.let(
                :V1,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            V2 =
              T.let(
                :V2,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            WH =
              T.let(
                :WH,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            XAA =
              T.let(
                :XAA,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            YY =
              T.let(
                :YY,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )
            ZZZ =
              T.let(
                :ZZZ,
                EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::ReasonCode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
          module TaxCode
            extend EInvoiceAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AE =
              T.let(
                :AE,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            E =
              T.let(
                :E,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            S =
              T.let(
                :S,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            Z =
              T.let(
                :Z,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            G =
              T.let(
                :G,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            O =
              T.let(
                :O,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            K =
              T.let(
                :K,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            L =
              T.let(
                :L,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            M =
              T.let(
                :M,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )
            B =
              T.let(
                :B,
                EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The VAT rate, represented as percentage that applies to the charge
          module TaxRate
            extend EInvoiceAPI::Internal::Type::Union

            Variants = T.type_alias { T.any(Float, String) }

            sig do
              override.returns(
                T::Array[
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxRate::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        # The quantity of items (goods or services) that is the subject of the line item.
        # Must be rounded to maximum 4 decimals. Can be negative for credit notes or
        # corrections.
        module Quantity
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Item::Quantity::Variants]
            )
          end
          def self.variants
          end
        end

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals.
        # Can be negative for credit notes or corrections.
        module Tax
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Item::Tax::Variants]
            )
          end
          def self.variants
          end
        end

        # The VAT rate of the line item expressed as percentage with 2 decimals
        module TaxRate
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Item::TaxRate::Variants]
            )
          end
          def self.variants
          end
        end

        # The item net price (BT-146). The price of an item, exclusive of VAT, after
        # subtracting item price discount. Must be rounded to maximum 4 decimals
        module UnitPrice
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::Item::UnitPrice::Variants]
            )
          end
          def self.variants
          end
        end
      end

      # The previous unpaid balance from prior invoices, if any. Must be positive and
      # rounded to maximum 2 decimals
      module PreviousUnpaidBalance
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # The taxable base of the invoice. Should be the sum of all line items -
      # allowances (for example commercial discounts) + charges with impact on VAT. Must
      # be positive and rounded to maximum 2 decimals
      module Subtotal
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::Subtotal::Variants]
          )
        end
        def self.variants
        end
      end

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentCreate::TaxCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE = T.let(:AE, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        E = T.let(:E, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        S = T.let(:S, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        Z = T.let(:Z, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        G = T.let(:G, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        O = T.let(:O, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        K = T.let(:K, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        L = T.let(:L, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        M = T.let(:M, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)
        B = T.let(:B, EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::TaxCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentCreate::TaxDetail,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The tax amount for this tax category. Must be rounded to maximum 2 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::TaxDetail::Amount::Variants)
          )
        end
        attr_accessor :amount

        # The tax rate as a percentage (e.g., '21.00', '6.00', '0.00')
        sig { returns(T.nilable(String)) }
        attr_accessor :rate

        sig do
          params(
            amount:
              T.nilable(
                EInvoiceAPI::DocumentCreate::TaxDetail::Amount::Variants
              ),
            rate: T.nilable(String)
          ).returns(T.attached_class)
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
            {
              amount:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::TaxDetail::Amount::Variants
                ),
              rate: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The tax amount for this tax category. Must be rounded to maximum 2 decimals
        module Amount
          extend EInvoiceAPI::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoiceAPI::DocumentCreate::TaxDetail::Amount::Variants]
            )
          end
          def self.variants
          end
        end
      end

      # The net financial discount/charge of the invoice (non-VAT charges minus non-VAT
      # allowances). Can be positive (net charge), negative (net discount), or zero.
      # Must be rounded to maximum 2 decimals
      module TotalDiscount
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::TotalDiscount::Variants]
          )
        end
        def self.variants
        end
      end

      # The total tax amount of the invoice. Must be positive and rounded to maximum 2
      # decimals
      module TotalTax
        extend EInvoiceAPI::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::TotalTax::Variants]
          )
        end
        def self.variants
        end
      end

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      module Vatex
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentCreate::Vatex) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VATEX_EU_79_C =
          T.let(
            :"VATEX-EU-79-C",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132 =
          T.let(
            :"VATEX-EU-132",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_A =
          T.let(
            :"VATEX-EU-132-1A",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_B =
          T.let(
            :"VATEX-EU-132-1B",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_C =
          T.let(
            :"VATEX-EU-132-1C",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_D =
          T.let(
            :"VATEX-EU-132-1D",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_E =
          T.let(
            :"VATEX-EU-132-1E",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_F =
          T.let(
            :"VATEX-EU-132-1F",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_G =
          T.let(
            :"VATEX-EU-132-1G",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_H =
          T.let(
            :"VATEX-EU-132-1H",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_I =
          T.let(
            :"VATEX-EU-132-1I",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_J =
          T.let(
            :"VATEX-EU-132-1J",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_K =
          T.let(
            :"VATEX-EU-132-1K",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_L =
          T.let(
            :"VATEX-EU-132-1L",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_M =
          T.let(
            :"VATEX-EU-132-1M",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_N =
          T.let(
            :"VATEX-EU-132-1N",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_O =
          T.let(
            :"VATEX-EU-132-1O",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_P =
          T.let(
            :"VATEX-EU-132-1P",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_Q =
          T.let(
            :"VATEX-EU-132-1Q",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143 =
          T.let(
            :"VATEX-EU-143",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_A =
          T.let(
            :"VATEX-EU-143-1A",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_B =
          T.let(
            :"VATEX-EU-143-1B",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_C =
          T.let(
            :"VATEX-EU-143-1C",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_D =
          T.let(
            :"VATEX-EU-143-1D",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_E =
          T.let(
            :"VATEX-EU-143-1E",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_F =
          T.let(
            :"VATEX-EU-143-1F",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_FA =
          T.let(
            :"VATEX-EU-143-1FA",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_G =
          T.let(
            :"VATEX-EU-143-1G",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_H =
          T.let(
            :"VATEX-EU-143-1H",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_I =
          T.let(
            :"VATEX-EU-143-1I",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_J =
          T.let(
            :"VATEX-EU-143-1J",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_K =
          T.let(
            :"VATEX-EU-143-1K",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_L =
          T.let(
            :"VATEX-EU-143-1L",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_144 =
          T.let(
            :"VATEX-EU-144",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_146_1_E =
          T.let(
            :"VATEX-EU-146-1E",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148 =
          T.let(
            :"VATEX-EU-148",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_A =
          T.let(
            :"VATEX-EU-148-A",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_B =
          T.let(
            :"VATEX-EU-148-B",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_C =
          T.let(
            :"VATEX-EU-148-C",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_D =
          T.let(
            :"VATEX-EU-148-D",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_E =
          T.let(
            :"VATEX-EU-148-E",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_F =
          T.let(
            :"VATEX-EU-148-F",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_148_G =
          T.let(
            :"VATEX-EU-148-G",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151 =
          T.let(
            :"VATEX-EU-151",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_A =
          T.let(
            :"VATEX-EU-151-1A",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_AA =
          T.let(
            :"VATEX-EU-151-1AA",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_B =
          T.let(
            :"VATEX-EU-151-1B",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_C =
          T.let(
            :"VATEX-EU-151-1C",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_D =
          T.let(
            :"VATEX-EU-151-1D",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_E =
          T.let(
            :"VATEX-EU-151-1E",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_159 =
          T.let(
            :"VATEX-EU-159",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_309 =
          T.let(
            :"VATEX-EU-309",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_AE =
          T.let(
            :"VATEX-EU-AE",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_D =
          T.let(:"VATEX-EU-D", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_EU_F =
          T.let(:"VATEX-EU-F", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_EU_G =
          T.let(:"VATEX-EU-G", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_EU_I =
          T.let(:"VATEX-EU-I", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_EU_IC =
          T.let(
            :"VATEX-EU-IC",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_EU_O =
          T.let(:"VATEX-EU-O", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_EU_J =
          T.let(:"VATEX-EU-J", EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol)
        VATEX_FR_FRANCHISE =
          T.let(
            :"VATEX-FR-FRANCHISE",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )
        VATEX_FR_CNWVAT =
          T.let(
            :"VATEX-FR-CNWVAT",
            EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentCreate::Vatex::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
