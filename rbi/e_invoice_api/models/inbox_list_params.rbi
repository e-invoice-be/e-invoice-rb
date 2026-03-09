# typed: strong

module EInvoiceAPI
  module Models
    class InboxListParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::InboxListParams, EInvoiceAPI::Internal::AnyHash)
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

      # Search in invoice number, seller/buyer names
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Filter by sender (vendor_name, vendor_email, vendor_tax_id, vendor_company_id)
      sig { returns(T.nilable(String)) }
      attr_accessor :sender

      # Field to sort by
      sig { returns(T.nilable(EInvoiceAPI::InboxListParams::SortBy::OrSymbol)) }
      attr_reader :sort_by

      sig do
        params(sort_by: EInvoiceAPI::InboxListParams::SortBy::OrSymbol).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(T.nilable(EInvoiceAPI::InboxListParams::SortOrder::OrSymbol))
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order: EInvoiceAPI::InboxListParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      # Filter by document type. If not provided, returns all types.
      sig { returns(T.nilable(EInvoiceAPI::DocumentType::OrSymbol)) }
      attr_accessor :type

      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sender: T.nilable(String),
          sort_by: EInvoiceAPI::InboxListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::InboxListParams::SortOrder::OrSymbol,
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
        # Search in invoice number, seller/buyer names
        search: nil,
        # Filter by sender (vendor_name, vendor_email, vendor_tax_id, vendor_company_id)
        sender: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document type. If not provided, returns all types.
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
            search: T.nilable(String),
            sender: T.nilable(String),
            sort_by: EInvoiceAPI::InboxListParams::SortBy::OrSymbol,
            sort_order: EInvoiceAPI::InboxListParams::SortOrder::OrSymbol,
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::InboxListParams::SortBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED_AT =
          T.let(:created_at, EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol)
        INVOICE_DATE =
          T.let(
            :invoice_date,
            EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol
          )
        DUE_DATE =
          T.let(:due_date, EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol)
        INVOICE_TOTAL =
          T.let(
            :invoice_total,
            EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol
          )
        CUSTOMER_NAME =
          T.let(
            :customer_name,
            EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol
          )
        VENDOR_NAME =
          T.let(
            :vendor_name,
            EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol
          )
        INVOICE_ID =
          T.let(:invoice_id, EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::InboxListParams::SortBy::TaggedSymbol]
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
            T.all(Symbol, EInvoiceAPI::InboxListParams::SortOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC = T.let(:asc, EInvoiceAPI::InboxListParams::SortOrder::TaggedSymbol)
        DESC =
          T.let(:desc, EInvoiceAPI::InboxListParams::SortOrder::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::InboxListParams::SortOrder::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
