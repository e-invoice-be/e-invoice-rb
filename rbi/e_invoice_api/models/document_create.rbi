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

      # The amount due of the invoice. Must be positive and rounded to maximum 2
      # decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::AmountDue::Variants))
      end
      attr_accessor :amount_due

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentAttachmentCreate]))
      end
      attr_accessor :attachments

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

      sig { returns(T.nilable(T::Array[EInvoiceAPI::DocumentCreate::Charge])) }
      attr_accessor :charges

      # Currency of the invoice
      sig { returns(T.nilable(EInvoiceAPI::CurrencyCode::OrSymbol)) }
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

      sig { returns(T.nilable(EInvoiceAPI::DocumentDirection::OrSymbol)) }
      attr_reader :direction

      sig { params(direction: EInvoiceAPI::DocumentDirection::OrSymbol).void }
      attr_writer :direction

      sig { returns(T.nilable(EInvoiceAPI::DocumentType::OrSymbol)) }
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

      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig { returns(T.nilable(T::Array[EInvoiceAPI::PaymentDetailCreate])) }
      attr_accessor :payment_details

      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

      # The previous unpaid balance of the invoice, if any. Must be positive and rounded
      # to maximum 2 decimals
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::DocumentCreate::PreviousUnpaidBalance::Variants
          )
        )
      end
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

      # Tax category code of the invoice
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

      # The total financial discount of the invoice (so discounts not subject to VAT).
      # Must be positive and rounded to maximum 2 decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::TotalDiscount::Variants))
      end
      attr_accessor :total_discount

      # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
      sig do
        returns(T.nilable(EInvoiceAPI::DocumentCreate::TotalTax::Variants))
      end
      attr_accessor :total_tax

      # VATEX code list for VAT exemption reasons
      #
      # Agency: CEF Identifier: vatex
      sig { returns(T.nilable(EInvoiceAPI::DocumentCreate::Vatex::OrSymbol)) }
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
        # Tax category code of the invoice
        tax_code: nil,
        tax_details: nil,
        # The total financial discount of the invoice (so discounts not subject to VAT).
        # Must be positive and rounded to maximum 2 decimals
        total_discount: nil,
        # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
        total_tax: nil,
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

      # The amount due of the invoice. Must be positive and rounded to maximum 2
      # decimals
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

      # The total amount of the invoice (so invoice_total = subtotal + total_tax +
      # total_discount). Must be positive and rounded to maximum 2 decimals
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

      # The previous unpaid balance of the invoice, if any. Must be positive and rounded
      # to maximum 2 decimals
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

      # Tax category code of the invoice
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

        sig do
          returns(
            T.nilable(EInvoiceAPI::DocumentCreate::TaxDetail::Amount::Variants)
          )
        end
        attr_accessor :amount

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
        def self.new(amount: nil, rate: nil)
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

      # The total financial discount of the invoice (so discounts not subject to VAT).
      # Must be positive and rounded to maximum 2 decimals
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

      # The total tax of the invoice. Must be positive and rounded to maximum 2 decimals
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
