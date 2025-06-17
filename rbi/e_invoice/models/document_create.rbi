# typed: strong

module EInvoice
  module Models
    class DocumentCreate < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoice::DocumentCreate, EInvoice::Internal::AnyHash)
        end

      sig { returns(T.nilable(EInvoice::DocumentCreate::AmountDue::Variants)) }
      attr_accessor :amount_due

      sig { returns(T.nilable(T::Array[EInvoice::DocumentAttachmentCreate])) }
      attr_accessor :attachments

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

      # Currency of the invoice
      sig { returns(T.nilable(EInvoice::CurrencyCode::OrSymbol)) }
      attr_reader :currency

      sig { params(currency: EInvoice::CurrencyCode::OrSymbol).void }
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

      sig { returns(T.nilable(EInvoice::DocumentDirection::OrSymbol)) }
      attr_reader :direction

      sig { params(direction: EInvoice::DocumentDirection::OrSymbol).void }
      attr_writer :direction

      sig { returns(T.nilable(EInvoice::DocumentType::OrSymbol)) }
      attr_reader :document_type

      sig { params(document_type: EInvoice::DocumentType::OrSymbol).void }
      attr_writer :document_type

      sig { returns(T.nilable(Date)) }
      attr_accessor :due_date

      sig { returns(T.nilable(Date)) }
      attr_accessor :invoice_date

      sig { returns(T.nilable(String)) }
      attr_accessor :invoice_id

      sig do
        returns(T.nilable(EInvoice::DocumentCreate::InvoiceTotal::Variants))
      end
      attr_accessor :invoice_total

      sig { returns(T.nilable(T::Array[EInvoice::DocumentCreate::Item])) }
      attr_accessor :items

      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig { returns(T.nilable(T::Array[EInvoice::PaymentDetailCreate])) }
      attr_accessor :payment_details

      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

      sig do
        returns(
          T.nilable(EInvoice::DocumentCreate::PreviousUnpaidBalance::Variants)
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

      sig { returns(T.nilable(EInvoice::DocumentState::OrSymbol)) }
      attr_reader :state

      sig { params(state: EInvoice::DocumentState::OrSymbol).void }
      attr_writer :state

      sig { returns(T.nilable(EInvoice::DocumentCreate::Subtotal::Variants)) }
      attr_accessor :subtotal

      sig { returns(T.nilable(T::Array[EInvoice::DocumentCreate::TaxDetail])) }
      attr_accessor :tax_details

      sig do
        returns(T.nilable(EInvoice::DocumentCreate::TotalDiscount::Variants))
      end
      attr_accessor :total_discount

      sig { returns(T.nilable(EInvoice::DocumentCreate::TotalTax::Variants)) }
      attr_accessor :total_tax

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
          amount_due: T.nilable(EInvoice::DocumentCreate::AmountDue::Variants),
          attachments:
            T.nilable(T::Array[EInvoice::DocumentAttachmentCreate::OrHash]),
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
          currency: EInvoice::CurrencyCode::OrSymbol,
          customer_address: T.nilable(String),
          customer_address_recipient: T.nilable(String),
          customer_email: T.nilable(String),
          customer_id: T.nilable(String),
          customer_name: T.nilable(String),
          customer_tax_id: T.nilable(String),
          direction: EInvoice::DocumentDirection::OrSymbol,
          document_type: EInvoice::DocumentType::OrSymbol,
          due_date: T.nilable(Date),
          invoice_date: T.nilable(Date),
          invoice_id: T.nilable(String),
          invoice_total:
            T.nilable(EInvoice::DocumentCreate::InvoiceTotal::Variants),
          items: T.nilable(T::Array[EInvoice::DocumentCreate::Item::OrHash]),
          note: T.nilable(String),
          payment_details:
            T.nilable(T::Array[EInvoice::PaymentDetailCreate::OrHash]),
          payment_term: T.nilable(String),
          previous_unpaid_balance:
            T.nilable(
              EInvoice::DocumentCreate::PreviousUnpaidBalance::Variants
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
          state: EInvoice::DocumentState::OrSymbol,
          subtotal: T.nilable(EInvoice::DocumentCreate::Subtotal::Variants),
          tax_details:
            T.nilable(T::Array[EInvoice::DocumentCreate::TaxDetail::OrHash]),
          total_discount:
            T.nilable(EInvoice::DocumentCreate::TotalDiscount::Variants),
          total_tax: T.nilable(EInvoice::DocumentCreate::TotalTax::Variants),
          vendor_address: T.nilable(String),
          vendor_address_recipient: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        amount_due: nil,
        attachments: nil,
        billing_address: nil,
        billing_address_recipient: nil,
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
        invoice_total: nil,
        items: nil,
        note: nil,
        payment_details: nil,
        payment_term: nil,
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
        subtotal: nil,
        tax_details: nil,
        total_discount: nil,
        total_tax: nil,
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
            amount_due:
              T.nilable(EInvoice::DocumentCreate::AmountDue::Variants),
            attachments:
              T.nilable(T::Array[EInvoice::DocumentAttachmentCreate]),
            billing_address: T.nilable(String),
            billing_address_recipient: T.nilable(String),
            currency: EInvoice::CurrencyCode::OrSymbol,
            customer_address: T.nilable(String),
            customer_address_recipient: T.nilable(String),
            customer_email: T.nilable(String),
            customer_id: T.nilable(String),
            customer_name: T.nilable(String),
            customer_tax_id: T.nilable(String),
            direction: EInvoice::DocumentDirection::OrSymbol,
            document_type: EInvoice::DocumentType::OrSymbol,
            due_date: T.nilable(Date),
            invoice_date: T.nilable(Date),
            invoice_id: T.nilable(String),
            invoice_total:
              T.nilable(EInvoice::DocumentCreate::InvoiceTotal::Variants),
            items: T.nilable(T::Array[EInvoice::DocumentCreate::Item]),
            note: T.nilable(String),
            payment_details: T.nilable(T::Array[EInvoice::PaymentDetailCreate]),
            payment_term: T.nilable(String),
            previous_unpaid_balance:
              T.nilable(
                EInvoice::DocumentCreate::PreviousUnpaidBalance::Variants
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
            state: EInvoice::DocumentState::OrSymbol,
            subtotal: T.nilable(EInvoice::DocumentCreate::Subtotal::Variants),
            tax_details:
              T.nilable(T::Array[EInvoice::DocumentCreate::TaxDetail]),
            total_discount:
              T.nilable(EInvoice::DocumentCreate::TotalDiscount::Variants),
            total_tax: T.nilable(EInvoice::DocumentCreate::TotalTax::Variants),
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

      module AmountDue
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::AmountDue::Variants]
          )
        end
        def self.variants
        end
      end

      module InvoiceTotal
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::InvoiceTotal::Variants]
          )
        end
        def self.variants
        end
      end

      class Item < EInvoice::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(EInvoice::DocumentCreate::Item, EInvoice::Internal::AnyHash)
          end

        sig do
          returns(T.nilable(EInvoice::DocumentCreate::Item::Amount::Variants))
        end
        attr_accessor :amount

        sig { void }
        attr_accessor :date

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig { returns(T.nilable(String)) }
        attr_accessor :product_code

        sig do
          returns(T.nilable(EInvoice::DocumentCreate::Item::Quantity::Variants))
        end
        attr_accessor :quantity

        sig do
          returns(T.nilable(EInvoice::DocumentCreate::Item::Tax::Variants))
        end
        attr_accessor :tax

        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoice::UnitOfMeasureCode::OrSymbol)) }
        attr_accessor :unit

        sig do
          returns(
            T.nilable(EInvoice::DocumentCreate::Item::UnitPrice::Variants)
          )
        end
        attr_accessor :unit_price

        sig do
          params(
            amount: T.nilable(EInvoice::DocumentCreate::Item::Amount::Variants),
            date: NilClass,
            description: T.nilable(String),
            product_code: T.nilable(String),
            quantity:
              T.nilable(EInvoice::DocumentCreate::Item::Quantity::Variants),
            tax: T.nilable(EInvoice::DocumentCreate::Item::Tax::Variants),
            tax_rate: T.nilable(String),
            unit: T.nilable(EInvoice::UnitOfMeasureCode::OrSymbol),
            unit_price:
              T.nilable(EInvoice::DocumentCreate::Item::UnitPrice::Variants)
          ).returns(T.attached_class)
        end
        def self.new(
          amount: nil,
          date: nil,
          description: nil,
          product_code: nil,
          quantity: nil,
          tax: nil,
          tax_rate: nil,
          # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
          unit: nil,
          unit_price: nil
        )
        end

        sig do
          override.returns(
            {
              amount:
                T.nilable(EInvoice::DocumentCreate::Item::Amount::Variants),
              date: NilClass,
              description: T.nilable(String),
              product_code: T.nilable(String),
              quantity:
                T.nilable(EInvoice::DocumentCreate::Item::Quantity::Variants),
              tax: T.nilable(EInvoice::DocumentCreate::Item::Tax::Variants),
              tax_rate: T.nilable(String),
              unit: T.nilable(EInvoice::UnitOfMeasureCode::OrSymbol),
              unit_price:
                T.nilable(EInvoice::DocumentCreate::Item::UnitPrice::Variants)
            }
          )
        end
        def to_hash
        end

        module Amount
          extend EInvoice::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoice::DocumentCreate::Item::Amount::Variants]
            )
          end
          def self.variants
          end
        end

        module Quantity
          extend EInvoice::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoice::DocumentCreate::Item::Quantity::Variants]
            )
          end
          def self.variants
          end
        end

        module Tax
          extend EInvoice::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoice::DocumentCreate::Item::Tax::Variants]
            )
          end
          def self.variants
          end
        end

        module UnitPrice
          extend EInvoice::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoice::DocumentCreate::Item::UnitPrice::Variants]
            )
          end
          def self.variants
          end
        end
      end

      module PreviousUnpaidBalance
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::PreviousUnpaidBalance::Variants]
          )
        end
        def self.variants
        end
      end

      module Subtotal
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::Subtotal::Variants]
          )
        end
        def self.variants
        end
      end

      class TaxDetail < EInvoice::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoice::DocumentCreate::TaxDetail,
              EInvoice::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(EInvoice::DocumentCreate::TaxDetail::Amount::Variants)
          )
        end
        attr_accessor :amount

        sig { returns(T.nilable(String)) }
        attr_accessor :rate

        sig do
          params(
            amount:
              T.nilable(EInvoice::DocumentCreate::TaxDetail::Amount::Variants),
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
                  EInvoice::DocumentCreate::TaxDetail::Amount::Variants
                ),
              rate: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Amount
          extend EInvoice::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[EInvoice::DocumentCreate::TaxDetail::Amount::Variants]
            )
          end
          def self.variants
          end
        end
      end

      module TotalDiscount
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::TotalDiscount::Variants]
          )
        end
        def self.variants
        end
      end

      module TotalTax
        extend EInvoice::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[EInvoice::DocumentCreate::TotalTax::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
