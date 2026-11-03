# typed: strong

module EInvoiceAPI
  module Models
    class MailboxListParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::MailboxListParams, EInvoiceAPI::Internal::AnyHash)
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

      # Filter by processing status. If not provided, returns all. Ignored when `status`
      # is set.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :processed

      # Inclusive lower bound on received date (falls back to created_at when
      # received_at is null)
      sig { returns(T.nilable(Time)) }
      attr_accessor :received_from

      # Inclusive upper bound on received date (falls back to created_at when
      # received_at is null)
      sig { returns(T.nilable(Time)) }
      attr_accessor :received_to

      # Case-insensitive search across sender email, subject, message ID, and attachment
      # filenames
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Field to sort by
      sig do
        returns(T.nilable(EInvoiceAPI::MailboxListParams::SortBy::OrSymbol))
      end
      attr_reader :sort_by

      sig do
        params(sort_by: EInvoiceAPI::MailboxListParams::SortBy::OrSymbol).void
      end
      attr_writer :sort_by

      # Sort direction (asc/desc)
      sig do
        returns(T.nilable(EInvoiceAPI::MailboxListParams::SortOrder::OrSymbol))
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order: EInvoiceAPI::MailboxListParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      # Filter by status: pending, success, or failed. Takes precedence over `processed`
      # if both are provided.
      sig do
        returns(T.nilable(EInvoiceAPI::MailboxListParams::Status::OrSymbol))
      end
      attr_accessor :status

      sig do
        params(
          page: Integer,
          page_size: Integer,
          processed: T.nilable(T::Boolean),
          received_from: T.nilable(Time),
          received_to: T.nilable(Time),
          search: T.nilable(String),
          sort_by: EInvoiceAPI::MailboxListParams::SortBy::OrSymbol,
          sort_order: EInvoiceAPI::MailboxListParams::SortOrder::OrSymbol,
          status: T.nilable(EInvoiceAPI::MailboxListParams::Status::OrSymbol),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        # Filter by processing status. If not provided, returns all. Ignored when `status`
        # is set.
        processed: nil,
        # Inclusive lower bound on received date (falls back to created_at when
        # received_at is null)
        received_from: nil,
        # Inclusive upper bound on received date (falls back to created_at when
        # received_at is null)
        received_to: nil,
        # Case-insensitive search across sender email, subject, message ID, and attachment
        # filenames
        search: nil,
        # Field to sort by
        sort_by: nil,
        # Sort direction (asc/desc)
        sort_order: nil,
        # Filter by status: pending, success, or failed. Takes precedence over `processed`
        # if both are provided.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            processed: T.nilable(T::Boolean),
            received_from: T.nilable(Time),
            received_to: T.nilable(Time),
            search: T.nilable(String),
            sort_by: EInvoiceAPI::MailboxListParams::SortBy::OrSymbol,
            sort_order: EInvoiceAPI::MailboxListParams::SortOrder::OrSymbol,
            status: T.nilable(EInvoiceAPI::MailboxListParams::Status::OrSymbol),
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
          T.type_alias { T.all(Symbol, EInvoiceAPI::MailboxListParams::SortBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RECEIVED_AT =
          T.let(
            :received_at,
            EInvoiceAPI::MailboxListParams::SortBy::TaggedSymbol
          )
        CREATED_AT =
          T.let(
            :created_at,
            EInvoiceAPI::MailboxListParams::SortBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[EInvoiceAPI::MailboxListParams::SortBy::TaggedSymbol]
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
            T.all(Symbol, EInvoiceAPI::MailboxListParams::SortOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(:asc, EInvoiceAPI::MailboxListParams::SortOrder::TaggedSymbol)
        DESC =
          T.let(:desc, EInvoiceAPI::MailboxListParams::SortOrder::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::MailboxListParams::SortOrder::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by status: pending, success, or failed. Takes precedence over `processed`
      # if both are provided.
      module Status
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::MailboxListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, EInvoiceAPI::MailboxListParams::Status::TaggedSymbol)
        SUCCESS =
          T.let(:success, EInvoiceAPI::MailboxListParams::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, EInvoiceAPI::MailboxListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::MailboxListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
