# typed: strong

module EInvoiceAPI
  module Models
    class InboxListInvoicesParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::InboxListInvoicesParams,
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

      # Field to sort by
      sig do
        returns(
          T.nilable(EInvoiceAPI::InboxListInvoicesParams::SortBy::OrSymbol)
        )
      end
      attr_reader :sort_by

      sig do
        params(
          sort_by: EInvoiceAPI::InboxListInvoicesParams::SortBy::OrSymbol
        ).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(
          T.nilable(EInvoiceAPI::InboxListInvoicesParams::SortOrder::OrSymbol)
        )
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order: EInvoiceAPI::InboxListInvoicesParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      sig do
        params(
          page: Integer,
          page_size: Integer,
          sort_by: EInvoiceAPI::InboxListInvoicesParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::InboxListInvoicesParams::SortOrder::OrSymbol,
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            sort_by: EInvoiceAPI::InboxListInvoicesParams::SortBy::OrSymbol,
            sort_order:
              EInvoiceAPI::InboxListInvoicesParams::SortOrder::OrSymbol,
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
            T.all(Symbol, EInvoiceAPI::InboxListInvoicesParams::SortBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATED_AT =
          T.let(
            :created_at,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        INVOICE_DATE =
          T.let(
            :invoice_date,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        DUE_DATE =
          T.let(
            :due_date,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        INVOICE_TOTAL =
          T.let(
            :invoice_total,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        CUSTOMER_NAME =
          T.let(
            :customer_name,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        VENDOR_NAME =
          T.let(
            :vendor_name,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )
        INVOICE_ID =
          T.let(
            :invoice_id,
            EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[EInvoiceAPI::InboxListInvoicesParams::SortBy::TaggedSymbol]
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
            T.all(Symbol, EInvoiceAPI::InboxListInvoicesParams::SortOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(
            :asc,
            EInvoiceAPI::InboxListInvoicesParams::SortOrder::TaggedSymbol
          )
        DESC =
          T.let(
            :desc,
            EInvoiceAPI::InboxListInvoicesParams::SortOrder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::InboxListInvoicesParams::SortOrder::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
