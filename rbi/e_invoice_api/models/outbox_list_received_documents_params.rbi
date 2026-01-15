# typed: strong

module EInvoiceAPI
  module Models
    class OutboxListReceivedDocumentsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::OutboxListReceivedDocumentsParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Filter by issue date (from)
      sig { returns(T.nilable(Time)) }
      attr_accessor :date_from

      # Filter by issue date (to)
      sig { returns(T.nilable(Time)) }
      attr_accessor :date_to

      # Page number
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      # Filter by receiver (customer_name, customer_email, customer_tax_id,
      # customer_company_id, customer_id)
      sig { returns(T.nilable(String)) }
      attr_accessor :receiver

      # Search in invoice number, seller/buyer names
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # (Deprecated) Filter by sender ID
      sig { returns(T.nilable(String)) }
      attr_accessor :sender

      # Field to sort by
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::OrSymbol
          )
        )
      end
      attr_reader :sort_by

      sig do
        params(
          sort_by:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::OrSymbol
        ).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::OrSymbol
          )
        )
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      # Filter by document state
      sig { returns(T.nilable(EInvoiceAPI::DocumentState::OrSymbol)) }
      attr_accessor :state

      # Filter by document type
      sig { returns(T.nilable(EInvoiceAPI::DocumentType::OrSymbol)) }
      attr_accessor :type

      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          receiver: T.nilable(String),
          search: T.nilable(String),
          sender: T.nilable(String),
          sort_by:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::OrSymbol,
          sort_order:
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::OrSymbol,
          state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
          type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by issue date (from)
        date_from: nil,
        # Filter by issue date (to)
        date_to: nil,
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Filter by receiver (customer_name, customer_email, customer_tax_id,
        # customer_company_id, customer_id)
        receiver: nil,
        # Search in invoice number, seller/buyer names
        search: nil,
        # (Deprecated) Filter by sender ID
        sender: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document state
        state: nil,
        # Filter by document type
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            date_from: T.nilable(Time),
            date_to: T.nilable(Time),
            page: Integer,
            page_size: Integer,
            receiver: T.nilable(String),
            search: T.nilable(String),
            sender: T.nilable(String),
            sort_by:
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::OrSymbol,
            sort_order:
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::OrSymbol,
            state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
            type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Field to sort by
      module SortBy
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED_AT =
          T.let(
            :created_at,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_DATE =
          T.let(
            :invoice_date,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        DUE_DATE =
          T.let(
            :due_date,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_TOTAL =
          T.let(
            :invoice_total,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        CUSTOMER_NAME =
          T.let(
            :customer_name,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        VENDOR_NAME =
          T.let(
            :vendor_name,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_ID =
          T.let(
            :invoice_id,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Sort direction (asc/desc)
      module SortOrder
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(
            :asc,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::TaggedSymbol
          )
        DESC =
          T.let(
            :desc,
            EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
