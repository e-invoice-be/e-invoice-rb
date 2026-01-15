# typed: strong

module EInvoiceAPI
  module Models
    class OutboxListDraftDocumentsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::OutboxListDraftDocumentsParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

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
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::OrSymbol
          )
        )
      end
      attr_reader :sort_by

      sig do
        params(
          sort_by: EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::OrSymbol
        ).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::OrSymbol
          )
        )
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order:
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::OrSymbol
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
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sort_by:
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::OrSymbol,
          sort_order:
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::OrSymbol,
          state: T.nilable(EInvoiceAPI::DocumentState::OrSymbol),
          type: T.nilable(EInvoiceAPI::DocumentType::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
            page: Integer,
            page_size: Integer,
            search: T.nilable(String),
            sort_by:
              EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::OrSymbol,
            sort_order:
              EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::OrSymbol,
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
            T.all(Symbol, EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED_AT =
          T.let(
            :created_at,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_DATE =
          T.let(
            :invoice_date,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        DUE_DATE =
          T.let(
            :due_date,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_TOTAL =
          T.let(
            :invoice_total,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        CUSTOMER_NAME =
          T.let(
            :customer_name,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        VENDOR_NAME =
          T.let(
            :vendor_name,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )
        INVOICE_ID =
          T.let(
            :invoice_id,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy::TaggedSymbol
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
              EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(
            :asc,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::TaggedSymbol
          )
        DESC =
          T.let(
            :desc,
            EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
