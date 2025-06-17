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

      sig { returns(T.nilable(String)) }
      attr_accessor :amount_due

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::Documents::DocumentAttachment]))
      end
      attr_reader :attachments

      sig do
        params(
          attachments:
            T::Array[EInvoiceAPI::Documents::DocumentAttachment::OrHash]
        ).void
      end
      attr_writer :attachments

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_address_recipient

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

      sig { returns(T.nilable(String)) }
      attr_accessor :invoice_total

      sig { returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::Item])) }
      attr_reader :items

      sig do
        params(
          items: T::Array[EInvoiceAPI::DocumentResponse::Item::OrHash]
        ).void
      end
      attr_writer :items

      sig { returns(T.nilable(String)) }
      attr_accessor :note

      sig do
        returns(
          T.nilable(T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail])
        )
      end
      attr_reader :payment_details

      sig do
        params(
          payment_details:
            T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail::OrHash]
        ).void
      end
      attr_writer :payment_details

      sig { returns(T.nilable(String)) }
      attr_accessor :payment_term

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

      sig { returns(T.nilable(String)) }
      attr_accessor :subtotal

      sig do
        returns(T.nilable(T::Array[EInvoiceAPI::DocumentResponse::TaxDetail]))
      end
      attr_reader :tax_details

      sig do
        params(
          tax_details:
            T::Array[EInvoiceAPI::DocumentResponse::TaxDetail::OrHash]
        ).void
      end
      attr_writer :tax_details

      sig { returns(T.nilable(String)) }
      attr_accessor :total_discount

      sig { returns(T.nilable(String)) }
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
          id: String,
          amount_due: T.nilable(String),
          attachments:
            T::Array[EInvoiceAPI::Documents::DocumentAttachment::OrHash],
          billing_address: T.nilable(String),
          billing_address_recipient: T.nilable(String),
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
          items: T::Array[EInvoiceAPI::DocumentResponse::Item::OrHash],
          note: T.nilable(String),
          payment_details:
            T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail::OrHash],
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
          tax_details:
            T::Array[EInvoiceAPI::DocumentResponse::TaxDetail::OrHash],
          total_discount: T.nilable(String),
          total_tax: T.nilable(String),
          vendor_address: T.nilable(String),
          vendor_address_recipient: T.nilable(String),
          vendor_email: T.nilable(String),
          vendor_name: T.nilable(String),
          vendor_tax_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
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
            id: String,
            amount_due: T.nilable(String),
            attachments: T::Array[EInvoiceAPI::Documents::DocumentAttachment],
            billing_address: T.nilable(String),
            billing_address_recipient: T.nilable(String),
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
            items: T::Array[EInvoiceAPI::DocumentResponse::Item],
            note: T.nilable(String),
            payment_details:
              T::Array[EInvoiceAPI::DocumentResponse::PaymentDetail],
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
            tax_details: T::Array[EInvoiceAPI::DocumentResponse::TaxDetail],
            total_discount: T.nilable(String),
            total_tax: T.nilable(String),
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
              EInvoiceAPI::DocumentResponse::Item,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :amount

        sig { void }
        attr_accessor :date

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig { returns(T.nilable(String)) }
        attr_accessor :product_code

        sig { returns(T.nilable(String)) }
        attr_accessor :quantity

        sig { returns(T.nilable(String)) }
        attr_accessor :tax

        sig { returns(T.nilable(String)) }
        attr_accessor :tax_rate

        # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
        sig { returns(T.nilable(EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)) }
        attr_accessor :unit

        sig { returns(T.nilable(String)) }
        attr_accessor :unit_price

        sig do
          params(
            amount: T.nilable(String),
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
              amount: T.nilable(String),
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

        sig { returns(T.nilable(String)) }
        attr_accessor :bank_account_number

        sig { returns(T.nilable(String)) }
        attr_accessor :iban

        sig { returns(T.nilable(String)) }
        attr_accessor :payment_reference

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
          bank_account_number: nil,
          iban: nil,
          payment_reference: nil,
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

      class TaxDetail < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::DocumentResponse::TaxDetail,
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
    end
  end
end
