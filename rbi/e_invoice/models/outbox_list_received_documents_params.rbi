# typed: strong

module EInvoice
  module Models
    class OutboxListReceivedDocumentsParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoice::OutboxListReceivedDocumentsParams,
            EInvoice::Internal::AnyHash
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

      # Search in invoice number, seller/buyer names
      sig { returns(T.nilable(String)) }
      attr_accessor :search

      # Filter by sender ID
      sig { returns(T.nilable(String)) }
      attr_accessor :sender

      # Filter by document state
      sig { returns(T.nilable(EInvoice::DocumentState::OrSymbol)) }
      attr_accessor :state

      # Filter by document type
      sig { returns(T.nilable(EInvoice::DocumentType::OrSymbol)) }
      attr_accessor :type

      sig do
        params(
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          sender: T.nilable(String),
          state: T.nilable(EInvoice::DocumentState::OrSymbol),
          type: T.nilable(EInvoice::DocumentType::OrSymbol),
          request_options: EInvoice::RequestOptions::OrHash
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
        # Filter by sender ID
        sender: nil,
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
            search: T.nilable(String),
            sender: T.nilable(String),
            state: T.nilable(EInvoice::DocumentState::OrSymbol),
            type: T.nilable(EInvoice::DocumentType::OrSymbol),
            request_options: EInvoice::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
