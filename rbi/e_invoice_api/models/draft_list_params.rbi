# typed: strong

module EInvoiceAPI
  module Models
    class DraftListParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::DraftListParams, EInvoiceAPI::Internal::AnyHash)
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

      # Field to sort by
      sig { returns(T.nilable(EInvoiceAPI::DraftListParams::SortBy::OrSymbol)) }
      attr_reader :sort_by

      sig do
        params(sort_by: EInvoiceAPI::DraftListParams::SortBy::OrSymbol).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(T.nilable(EInvoiceAPI::DraftListParams::SortOrder::OrSymbol))
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order: EInvoiceAPI::DraftListParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      # Filter by document state. By default return all states (DRAFT, TRANSIT, FAILED).
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
          search: T.nilable(String),
          sort_by: EInvoiceAPI::DraftListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::DraftListParams::SortOrder::OrSymbol,
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
        # Search in invoice number, seller/buyer names
        search: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by document state. By default return all states (DRAFT, TRANSIT, FAILED).
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
            search: T.nilable(String),
            sort_by: EInvoiceAPI::DraftListParams::SortBy::OrSymbol,
            sort_order: EInvoiceAPI::DraftListParams::SortOrder::OrSymbol,
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::DraftListParams::SortBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED_AT =
          T.let(:created_at, EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol)
        INVOICE_DATE =
          T.let(
            :invoice_date,
            EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol
          )
        DUE_DATE =
          T.let(:due_date, EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol)
        INVOICE_TOTAL =
          T.let(
            :invoice_total,
            EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol
          )
        CUSTOMER_NAME =
          T.let(
            :customer_name,
            EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol
          )
        VENDOR_NAME =
          T.let(
            :vendor_name,
            EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol
          )
        INVOICE_ID =
          T.let(:invoice_id, EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DraftListParams::SortBy::TaggedSymbol]
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
            T.all(Symbol, EInvoiceAPI::DraftListParams::SortOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC = T.let(:asc, EInvoiceAPI::DraftListParams::SortOrder::TaggedSymbol)
        DESC =
          T.let(:desc, EInvoiceAPI::DraftListParams::SortOrder::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::DraftListParams::SortOrder::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
