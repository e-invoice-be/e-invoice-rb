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
        # to calculate the allowance amount. To state 20%, use value 20
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

        # The code for the allowance reason
        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol)
          )
        end
        attr_accessor :tax_code

        # The VAT rate, represented as percentage that applies to the allowance
        sig { returns(T.nilable(String)) }
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
            reason_code: T.nilable(String),
            tax_code:
              T.nilable(
                EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol
              ),
            tax_rate: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
          amount: nil,
          # The base amount that may be used, in conjunction with the allowance percentage,
          # to calculate the allowance amount. Must be rounded to maximum 2 decimals
          base_amount: nil,
          # The percentage that may be used, in conjunction with the allowance base amount,
          # to calculate the allowance amount. To state 20%, use value 20
          multiplier_factor: nil,
          # The reason for the allowance
          reason: nil,
          # The code for the allowance reason
          reason_code: nil,
          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
          tax_code: nil,
          # The VAT rate, represented as percentage that applies to the allowance
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
              reason_code: T.nilable(String),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Allowance::TaxCode::OrSymbol
                ),
              tax_rate: T.nilable(String)
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
        # to calculate the allowance amount. To state 20%, use value 20
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

        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
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

        # The code for the charge reason
        sig { returns(T.nilable(String)) }
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
        sig { returns(T.nilable(String)) }
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
            reason_code: T.nilable(String),
            tax_code:
              T.nilable(EInvoiceAPI::DocumentCreate::Charge::TaxCode::OrSymbol),
            tax_rate: T.nilable(String)
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
          # The code for the charge reason
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
              reason_code: T.nilable(String),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Charge::TaxCode::OrSymbol
                ),
              tax_rate: T.nilable(String)
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

        # The total amount of the line item, exclusive of VAT, after subtracting line
        # level allowances and adding line level charges. Must be rounded to maximum 2
        # decimals
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
        # Must be rounded to maximum 4 decimals
        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::Item::Quantity::Variants)
          )
        end
        attr_accessor :quantity

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals
        sig do
          returns(T.nilable(EInvoiceAPI::DocumentCreate::Item::Tax::Variants))
        end
        attr_accessor :tax

        # The VAT rate of the line item expressed as percentage with 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol)) }
        attr_accessor :unit

        # The unit price of the line item. Must be rounded to maximum 2 decimals
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
            tax_rate: T.nilable(String),
            unit: T.nilable(EInvoiceAPI::UnitOfMeasureCode::OrSymbol),
            unit_price:
              T.nilable(EInvoiceAPI::DocumentCreate::Item::UnitPrice::Variants)
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
              tax_rate: T.nilable(String),
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
          # to calculate the allowance amount. To state 20%, use value 20
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

          # The code for the allowance reason
          sig { returns(T.nilable(String)) }
          attr_accessor :reason_code

          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
          sig do
            returns(
              T.nilable(
                EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol
              )
            )
          end
          attr_accessor :tax_code

          # The VAT rate, represented as percentage that applies to the allowance
          sig { returns(T.nilable(String)) }
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
              reason_code: T.nilable(String),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol
                ),
              tax_rate: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
            amount: nil,
            # The base amount that may be used, in conjunction with the allowance percentage,
            # to calculate the allowance amount. Must be rounded to maximum 2 decimals
            base_amount: nil,
            # The percentage that may be used, in conjunction with the allowance base amount,
            # to calculate the allowance amount. To state 20%, use value 20
            multiplier_factor: nil,
            # The reason for the allowance
            reason: nil,
            # The code for the allowance reason
            reason_code: nil,
            # Duty or tax or fee category codes (Subset of UNCL5305)
            #
            # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
            tax_code: nil,
            # The VAT rate, represented as percentage that applies to the allowance
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
                reason_code: T.nilable(String),
                tax_code:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Allowance::TaxCode::OrSymbol
                  ),
                tax_rate: T.nilable(String)
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
          # to calculate the allowance amount. To state 20%, use value 20
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

          # Duty or tax or fee category codes (Subset of UNCL5305)
          #
          # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
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
        end

        # The total amount of the line item, exclusive of VAT, after subtracting line
        # level allowances and adding line level charges. Must be rounded to maximum 2
        # decimals
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

          # The code for the charge reason
          sig { returns(T.nilable(String)) }
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
          sig { returns(T.nilable(String)) }
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
              reason_code: T.nilable(String),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::OrSymbol
                ),
              tax_rate: T.nilable(String)
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
            # The code for the charge reason
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
                reason_code: T.nilable(String),
                tax_code:
                  T.nilable(
                    EInvoiceAPI::DocumentCreate::Item::Charge::TaxCode::OrSymbol
                  ),
                tax_rate: T.nilable(String)
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
        end

        # The quantity of items (goods or services) that is the subject of the line item.
        # Must be rounded to maximum 4 decimals
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

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals
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

        # The unit price of the line item. Must be rounded to maximum 2 decimals
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
