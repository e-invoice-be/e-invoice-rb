# typed: strong

module EInvoiceAPI
  module Models
    class DocumentResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::DocumentResponse, EInvoiceAPI::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Allowance]))
      end
      attr_accessor :allowances

      # The amount due for payment. Must be positive and rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount_due

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::Documents::DocumentAttachment]))
      end
      attr_accessor :attachments

      # The billing address (if different from customer address)
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      # The recipient name at the billing address
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Charge]))
      end
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

      sig { returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Item])) }
      attr_accessor :items

      # Additional notes or comments for the invoice
      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig do
        returns(
          T.nilable(T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail])
        )
      end
      attr_accessor :payment_details

      # The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

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

      # Tax category code of the invoice (e.g., S for standard rate, Z for zero rate, E
      # for exempt)
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol))
      end
      attr_reader :tax_code

      sig do
        params(tax_code: EInvoiceAPI::DocumentResponse::TaxCode::OrSymbol).void
      end
      attr_writer :tax_code

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::TaxDetail]))
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

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol))
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
          id: String,
          allowances:
            T.nilable(
              T::Array[EInvoiceAPI::DocumentResponse::Allowance::OrHash]
            ),
          amount_due: T.nilable(String),
          attachments:
            T.nilable(
              T::Array[EInvoiceAPI::Documents::DocumentAttachment::OrHash]
            ),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          charges:
            T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Charge::OrHash]),
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
            T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Item::OrHash]),
          note: T.nilable(String),
          payment_details:
            T.nilable(
              T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail::OrHash]
            ),
          payment_term: T.nilable(String),
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
          tax_code: EInvoiceAPI::DocumentResponse::TaxCode::OrSymbol,
          tax_details:
            T.nilable(
              T::Array[EInvoiceAPI::DocumentResponse::TaxDetail::OrHash]
            ),
          total_discount: T.nilable(String),
          total_tax: T.nilable(String),
          vatex: T.nilable(EInvoiceAPI::DocumentResponse::Vatex::OrSymbol),
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
        id:,
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
        items: nil,
        # Additional notes or comments for the invoice
        note: nil,
        payment_details: nil,
        # The payment terms (e.g., 'Net 30', 'Due on receipt', '2/10 Net 30')
        payment_term: nil,
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
            id: String,
            allowances:
              T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Allowance]),
            amount_due: T.nilable(String),
            attachments:
              T.nilable(T::Array[EInvoiceAPI::Documents::DocumentAttachment]),
            billing_address: T.nilable(String),
            billing_address_recipient: T.nilable(String),
            charges: T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Charge]),
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
            items: T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Item]),
            note: T.nilable(String),
            payment_details:
              T.nilable(T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail]),
            payment_term: T.nilable(String),
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
            tax_code: EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol,
            tax_details:
              T.nilable(T::Array[EInvoiceAPI::DocumentResponse::TaxDetail]),
            total_discount: T.nilable(String),
            total_tax: T.nilable(String),
            vatex:
              T.nilable(EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol),
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
              EInvoiceAPI::DocumentResponse::Allowance,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The allowance amount, without VAT. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        # The base amount that may be used, in conjunction with the allowance percentage,
        # to calculate the allowance amount. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :base_amount

        # The percentage that may be used, in conjunction with the allowance base amount,
        # to calculate the allowance amount. To state 20%, use value 20. Must be rounded
        # to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :multiplier_factor

        # The reason for the allowance
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Allowance reason codes for invoice discounts and charges
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          )
        end
        attr_accessor :reason_code

        # The VAT category code that applies to the allowance
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          )
        end
        attr_reader :tax_code

        sig do
          params(
            tax_code:
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::OrSymbol
          ).void
        end
        attr_writer :tax_code

        # The VAT rate, represented as percentage that applies to the allowance. Must be
        # rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        sig do
          params(
            amount: T.nilable(String),
            base_amount: T.nilable(String),
            multiplier_factor: T.nilable(String),
            reason: T.nilable(String),
            reason_code:
              T.nilable(
                EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::OrSymbol
              ),
            tax_code:
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::OrSymbol,
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
              amount: T.nilable(String),
              base_amount: T.nilable(String),
              multiplier_factor: T.nilable(String),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
                ),
              tax_code:
                EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol,
              tax_rate: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Allowance reason codes for invoice discounts and charges
        module ReasonCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::DocumentResponse::Allowance::ReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REASON_CODE_41 =
            T.let(
              :"41",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_42 =
            T.let(
              :"42",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_60 =
            T.let(
              :"60",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_62 =
            T.let(
              :"62",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_63 =
            T.let(
              :"63",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_64 =
            T.let(
              :"64",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_65 =
            T.let(
              :"65",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_66 =
            T.let(
              :"66",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_67 =
            T.let(
              :"67",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_68 =
            T.let(
              :"68",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_70 =
            T.let(
              :"70",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_71 =
            T.let(
              :"71",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_88 =
            T.let(
              :"88",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_95 =
            T.let(
              :"95",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_100 =
            T.let(
              :"100",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_102 =
            T.let(
              :"102",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_103 =
            T.let(
              :"103",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_104 =
            T.let(
              :"104",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )
          REASON_CODE_105 =
            T.let(
              :"105",
              EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentResponse::Allowance::ReasonCode::TaggedSymbol
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
              T.all(Symbol, EInvoiceAPI::DocumentResponse::Allowance::TaxCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AE =
            T.let(
              :AE,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          E =
            T.let(
              :E,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          S =
            T.let(
              :S,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          Z =
            T.let(
              :Z,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          G =
            T.let(
              :G,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          O =
            T.let(
              :O,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          K =
            T.let(
              :K,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          L =
            T.let(
              :L,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          M =
            T.let(
              :M,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )
          B =
            T.let(
              :B,
              EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentResponse::Allowance::TaxCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Charge < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentResponse::Charge,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The charge amount, without VAT. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        # The base amount that may be used, in conjunction with the charge percentage, to
        # calculate the charge amount. Must be rounded to maximum 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :base_amount

        # The percentage that may be used, in conjunction with the charge base amount, to
        # calculate the charge amount. To state 20%, use value 20
        sig { returns(T.nilable(String)) }
        attr_accessor :multiplier_factor

        # The reason for the charge
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Charge reason codes for invoice charges and fees
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
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
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          )
        end
        attr_accessor :tax_code

        # The VAT rate, represented as percentage that applies to the charge
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        sig do
          params(
            amount: T.nilable(String),
            base_amount: T.nilable(String),
            multiplier_factor: T.nilable(String),
            reason: T.nilable(String),
            reason_code:
              T.nilable(
                EInvoiceAPI::DocumentResponse::Charge::ReasonCode::OrSymbol
              ),
            tax_code:
              T.nilable(
                EInvoiceAPI::DocumentResponse::Charge::TaxCode::OrSymbol
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
              amount: T.nilable(String),
              base_amount: T.nilable(String),
              multiplier_factor: T.nilable(String),
              reason: T.nilable(String),
              reason_code:
                T.nilable(
                  EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
                ),
              tax_code:
                T.nilable(
                  EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
                ),
              tax_rate: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Charge reason codes for invoice charges and fees
        module ReasonCode
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::DocumentResponse::Charge::ReasonCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AA =
            T.let(
              :AA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAA =
            T.let(
              :AAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAC =
            T.let(
              :AAC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAD =
            T.let(
              :AAD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAE =
            T.let(
              :AAE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAF =
            T.let(
              :AAF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAH =
            T.let(
              :AAH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAI =
            T.let(
              :AAI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAS =
            T.let(
              :AAS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAT =
            T.let(
              :AAT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAV =
            T.let(
              :AAV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAY =
            T.let(
              :AAY,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AAZ =
            T.let(
              :AAZ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABA =
            T.let(
              :ABA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABB =
            T.let(
              :ABB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABC =
            T.let(
              :ABC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABD =
            T.let(
              :ABD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABF =
            T.let(
              :ABF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABK =
            T.let(
              :ABK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABL =
            T.let(
              :ABL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABN =
            T.let(
              :ABN,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABR =
            T.let(
              :ABR,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABS =
            T.let(
              :ABS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABT =
            T.let(
              :ABT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ABU =
            T.let(
              :ABU,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACF =
            T.let(
              :ACF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACG =
            T.let(
              :ACG,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACH =
            T.let(
              :ACH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACI =
            T.let(
              :ACI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACJ =
            T.let(
              :ACJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACK =
            T.let(
              :ACK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACL =
            T.let(
              :ACL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACM =
            T.let(
              :ACM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ACS =
            T.let(
              :ACS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADC =
            T.let(
              :ADC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADE =
            T.let(
              :ADE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADJ =
            T.let(
              :ADJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADK =
            T.let(
              :ADK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADL =
            T.let(
              :ADL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADM =
            T.let(
              :ADM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADN =
            T.let(
              :ADN,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADO =
            T.let(
              :ADO,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADP =
            T.let(
              :ADP,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADQ =
            T.let(
              :ADQ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADR =
            T.let(
              :ADR,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADT =
            T.let(
              :ADT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADW =
            T.let(
              :ADW,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADY =
            T.let(
              :ADY,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ADZ =
            T.let(
              :ADZ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEA =
            T.let(
              :AEA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEB =
            T.let(
              :AEB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEC =
            T.let(
              :AEC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AED =
            T.let(
              :AED,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEF =
            T.let(
              :AEF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEH =
            T.let(
              :AEH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEI =
            T.let(
              :AEI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEJ =
            T.let(
              :AEJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEK =
            T.let(
              :AEK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEL =
            T.let(
              :AEL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEM =
            T.let(
              :AEM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEN =
            T.let(
              :AEN,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEO =
            T.let(
              :AEO,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEP =
            T.let(
              :AEP,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AES =
            T.let(
              :AES,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AET =
            T.let(
              :AET,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEU =
            T.let(
              :AEU,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEV =
            T.let(
              :AEV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEW =
            T.let(
              :AEW,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEX =
            T.let(
              :AEX,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEY =
            T.let(
              :AEY,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AEZ =
            T.let(
              :AEZ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AJ =
            T.let(
              :AJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          AU =
            T.let(
              :AU,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CA =
            T.let(
              :CA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAB =
            T.let(
              :CAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAD =
            T.let(
              :CAD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAE =
            T.let(
              :CAE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAF =
            T.let(
              :CAF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAI =
            T.let(
              :CAI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAJ =
            T.let(
              :CAJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAK =
            T.let(
              :CAK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAL =
            T.let(
              :CAL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAM =
            T.let(
              :CAM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAN =
            T.let(
              :CAN,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAO =
            T.let(
              :CAO,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAP =
            T.let(
              :CAP,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAQ =
            T.let(
              :CAQ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAR =
            T.let(
              :CAR,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAS =
            T.let(
              :CAS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAT =
            T.let(
              :CAT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAU =
            T.let(
              :CAU,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAV =
            T.let(
              :CAV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAW =
            T.let(
              :CAW,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAX =
            T.let(
              :CAX,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAY =
            T.let(
              :CAY,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CAZ =
            T.let(
              :CAZ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CD =
            T.let(
              :CD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CG =
            T.let(
              :CG,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CS =
            T.let(
              :CS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          CT =
            T.let(
              :CT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAB =
            T.let(
              :DAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAC =
            T.let(
              :DAC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAD =
            T.let(
              :DAD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAF =
            T.let(
              :DAF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAG =
            T.let(
              :DAG,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAH =
            T.let(
              :DAH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAI =
            T.let(
              :DAI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAJ =
            T.let(
              :DAJ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAK =
            T.let(
              :DAK,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAL =
            T.let(
              :DAL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAM =
            T.let(
              :DAM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAN =
            T.let(
              :DAN,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAO =
            T.let(
              :DAO,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAP =
            T.let(
              :DAP,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DAQ =
            T.let(
              :DAQ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          DL =
            T.let(
              :DL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          EG =
            T.let(
              :EG,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          EP =
            T.let(
              :EP,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ER =
            T.let(
              :ER,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FAA =
            T.let(
              :FAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FAB =
            T.let(
              :FAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FAC =
            T.let(
              :FAC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FC =
            T.let(
              :FC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FH =
            T.let(
              :FH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          FI =
            T.let(
              :FI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          GAA =
            T.let(
              :GAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          HAA =
            T.let(
              :HAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          HD =
            T.let(
              :HD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          HH =
            T.let(
              :HH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          IAA =
            T.let(
              :IAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          IAB =
            T.let(
              :IAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ID =
            T.let(
              :ID,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          IF =
            T.let(
              :IF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          IR =
            T.let(
              :IR,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          IS =
            T.let(
              :IS,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          KO =
            T.let(
              :KO,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          L1 =
            T.let(
              :L1,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          LA =
            T.let(
              :LA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          LAA =
            T.let(
              :LAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          LAB =
            T.let(
              :LAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          LF =
            T.let(
              :LF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          MAE =
            T.let(
              :MAE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          MI =
            T.let(
              :MI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ML =
            T.let(
              :ML,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          NAA =
            T.let(
              :NAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          OA =
            T.let(
              :OA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          PA =
            T.let(
              :PA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          PAA =
            T.let(
              :PAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          PC =
            T.let(
              :PC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          PL =
            T.let(
              :PL,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          PRV =
            T.let(
              :PRV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RAB =
            T.let(
              :RAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RAC =
            T.let(
              :RAC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RAD =
            T.let(
              :RAD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RAF =
            T.let(
              :RAF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RE =
            T.let(
              :RE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RF =
            T.let(
              :RF,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RH =
            T.let(
              :RH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          RV =
            T.let(
              :RV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SA =
            T.let(
              :SA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SAA =
            T.let(
              :SAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SAD =
            T.let(
              :SAD,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SAE =
            T.let(
              :SAE,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SAI =
            T.let(
              :SAI,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SG =
            T.let(
              :SG,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SH =
            T.let(
              :SH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SM =
            T.let(
              :SM,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          SU =
            T.let(
              :SU,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          TAB =
            T.let(
              :TAB,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          TAC =
            T.let(
              :TAC,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          TT =
            T.let(
              :TT,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          TV =
            T.let(
              :TV,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          V1 =
            T.let(
              :V1,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          V2 =
            T.let(
              :V2,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          WH =
            T.let(
              :WH,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          XAA =
            T.let(
              :XAA,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          YY =
            T.let(
              :YY,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )
          ZZZ =
            T.let(
              :ZZZ,
              EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentResponse::Charge::ReasonCode::TaggedSymbol
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
              T.all(Symbol, EInvoiceAPI::DocumentResponse::Charge::TaxCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AE =
            T.let(
              :AE,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          E =
            T.let(
              :E,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          S =
            T.let(
              :S,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          Z =
            T.let(
              :Z,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          G =
            T.let(
              :G,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          O =
            T.let(
              :O,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          K =
            T.let(
              :K,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          L =
            T.let(
              :L,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          M =
            T.let(
              :M,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )
          B =
            T.let(
              :B,
              EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::DocumentResponse::Charge::TaxCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Item < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentResponse::Item,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The allowances of the line item.
        sig { returns(T.nilable(T::Array[EInvoiceAPI::Allowance])) }
        attr_accessor :allowances

        # The invoice line net amount (BT-131), exclusive of VAT, inclusive of line level
        # allowances and charges. Calculated as: ((unit_price / price_base_quantity) \*
        # quantity) - allowances + charges. Must be rounded to maximum 2 decimals. Can be
        # negative for credit notes or corrections.
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
        # Must be rounded to maximum 4 decimals. Can be negative for credit notes or
        # corrections.
        sig { returns(T.nilable(String)) }
        attr_accessor :quantity

        # The total VAT amount for the line item. Must be rounded to maximum 2 decimals.
        # Can be negative for credit notes or corrections.
        sig { returns(T.nilable(String)) }
        attr_accessor :tax

        # The VAT rate of the line item expressed as percentage with 2 decimals
        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)) }
        attr_accessor :unit

        # The item net price (BT-146). The price of an item, exclusive of VAT, after
        # subtracting item price discount. Must be rounded to maximum 4 decimals
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

      class PaymentDetail < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentResponse::PaymentDetail,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # Bank account number (for non-IBAN accounts)
        sig { returns(T.nilable(String)) }
        attr_accessor :bank_account_number

        # International Bank Account Number for payment transfers
        sig { returns(T.nilable(String)) }
        attr_accessor :iban

        # Structured payment reference or communication (e.g., structured communication
        # for Belgian bank transfers)
        sig { returns(T.nilable(String)) }
        attr_accessor :payment_reference

        # SWIFT/BIC code of the bank
        sig { returns(T.nilable(String)) }
        attr_accessor :swift

        sig do
          params(
            bank_account_number: T.nilable(String),
            iban: T.nilable(String),
            payment_reference: T.nilable(String),
            swift: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Bank account number (for non-IBAN accounts)
          bank_account_number: nil,
          # International Bank Account Number for payment transfers
          iban: nil,
          # Structured payment reference or communication (e.g., structured communication
          # for Belgian bank transfers)
          payment_reference: nil,
          # SWIFT/BIC code of the bank
          swift: nil
        )
        end

        sig do
          override.returns(
            {
              bank_account_number: T.nilable(String),
              iban: T.nilable(String),
              payment_reference: T.nilable(String),
              swift: T.nilable(String)
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentResponse::TaxCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE = T.let(:AE, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        E = T.let(:E, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        S = T.let(:S, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        Z = T.let(:Z, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        G = T.let(:G, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        O = T.let(:O, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        K = T.let(:K, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        L = T.let(:L, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        M = T.let(:M, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)
        B = T.let(:B, EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentResponse::TaxCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentResponse::TaxDetail,
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::DocumentResponse::Vatex) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VATEX_EU_79_C =
          T.let(
            :"VATEX-EU-79-C",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132 =
          T.let(
            :"VATEX-EU-132",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_A =
          T.let(
            :"VATEX-EU-132-1A",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_B =
          T.let(
            :"VATEX-EU-132-1B",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_C =
          T.let(
            :"VATEX-EU-132-1C",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_D =
          T.let(
            :"VATEX-EU-132-1D",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_E =
          T.let(
            :"VATEX-EU-132-1E",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_F =
          T.let(
            :"VATEX-EU-132-1F",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_G =
          T.let(
            :"VATEX-EU-132-1G",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_H =
          T.let(
            :"VATEX-EU-132-1H",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_I =
          T.let(
            :"VATEX-EU-132-1I",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_J =
          T.let(
            :"VATEX-EU-132-1J",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_K =
          T.let(
            :"VATEX-EU-132-1K",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_L =
          T.let(
            :"VATEX-EU-132-1L",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_M =
          T.let(
            :"VATEX-EU-132-1M",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_N =
          T.let(
            :"VATEX-EU-132-1N",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_O =
          T.let(
            :"VATEX-EU-132-1O",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_P =
          T.let(
            :"VATEX-EU-132-1P",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_132_1_Q =
          T.let(
            :"VATEX-EU-132-1Q",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143 =
          T.let(
            :"VATEX-EU-143",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_A =
          T.let(
            :"VATEX-EU-143-1A",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_B =
          T.let(
            :"VATEX-EU-143-1B",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_C =
          T.let(
            :"VATEX-EU-143-1C",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_D =
          T.let(
            :"VATEX-EU-143-1D",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_E =
          T.let(
            :"VATEX-EU-143-1E",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_F =
          T.let(
            :"VATEX-EU-143-1F",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_FA =
          T.let(
            :"VATEX-EU-143-1FA",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_G =
          T.let(
            :"VATEX-EU-143-1G",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_H =
          T.let(
            :"VATEX-EU-143-1H",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_I =
          T.let(
            :"VATEX-EU-143-1I",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_J =
          T.let(
            :"VATEX-EU-143-1J",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_K =
          T.let(
            :"VATEX-EU-143-1K",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_143_1_L =
          T.let(
            :"VATEX-EU-143-1L",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_144 =
          T.let(
            :"VATEX-EU-144",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_146_1_E =
          T.let(
            :"VATEX-EU-146-1E",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148 =
          T.let(
            :"VATEX-EU-148",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_A =
          T.let(
            :"VATEX-EU-148-A",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_B =
          T.let(
            :"VATEX-EU-148-B",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_C =
          T.let(
            :"VATEX-EU-148-C",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_D =
          T.let(
            :"VATEX-EU-148-D",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_E =
          T.let(
            :"VATEX-EU-148-E",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_F =
          T.let(
            :"VATEX-EU-148-F",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_148_G =
          T.let(
            :"VATEX-EU-148-G",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151 =
          T.let(
            :"VATEX-EU-151",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_A =
          T.let(
            :"VATEX-EU-151-1A",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_AA =
          T.let(
            :"VATEX-EU-151-1AA",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_B =
          T.let(
            :"VATEX-EU-151-1B",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_C =
          T.let(
            :"VATEX-EU-151-1C",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_D =
          T.let(
            :"VATEX-EU-151-1D",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_151_1_E =
          T.let(
            :"VATEX-EU-151-1E",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_159 =
          T.let(
            :"VATEX-EU-159",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_309 =
          T.let(
            :"VATEX-EU-309",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_AE =
          T.let(
            :"VATEX-EU-AE",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_D =
          T.let(
            :"VATEX-EU-D",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_F =
          T.let(
            :"VATEX-EU-F",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_G =
          T.let(
            :"VATEX-EU-G",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_I =
          T.let(
            :"VATEX-EU-I",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_IC =
          T.let(
            :"VATEX-EU-IC",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_O =
          T.let(
            :"VATEX-EU-O",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_EU_J =
          T.let(
            :"VATEX-EU-J",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_FR_FRANCHISE =
          T.let(
            :"VATEX-FR-FRANCHISE",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )
        VATEX_FR_CNWVAT =
          T.let(
            :"VATEX-FR-CNWVAT",
            EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DocumentResponse::Vatex::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
