# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Outbox#list_received_documents
    class OutboxListReceivedDocumentsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute date_from
      #   Filter by issue date (from)
      #
      #   @return [Time, nil]
      optional :date_from, Time, nil?: true

      # @!attribute date_to
      #   Filter by issue date (to)
      #
      #   @return [Time, nil]
      optional :date_to, Time, nil?: true

      # @!attribute page
      #   Page number
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #   Number of items per page
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute receiver
      #   Filter by receiver (customer_name, customer_email, customer_tax_id,
      #   customer_company_id, customer_id)
      #
      #   @return [String, nil]
      optional :receiver, String, nil?: true

      # @!attribute search
      #   Search in invoice number, seller/buyer names
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute sender
      #   @deprecated
      #
      #   (Deprecated) Filter by sender ID
      #
      #   @return [String, nil]
      optional :sender, String, nil?: true

      # @!attribute sort_by
      #   Field to sort by
      #
      #   @return [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortBy, nil]
      optional :sort_by, enum: -> { EInvoiceAPI::OutboxListReceivedDocumentsParams::SortBy }

      # @!attribute sort_order
      #   Sort direction (asc/desc)
      #
      #   @return [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortOrder, nil]
      optional :sort_order, enum: -> { EInvoiceAPI::OutboxListReceivedDocumentsParams::SortOrder }

      # @!attribute type
      #   Filter by document type. If not provided, returns all types.
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentType, nil]
      optional :type, enum: -> { EInvoiceAPI::DocumentType }, nil?: true

      # @!method initialize(date_from: nil, date_to: nil, page: nil, page_size: nil, receiver: nil, search: nil, sender: nil, sort_by: nil, sort_order: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::OutboxListReceivedDocumentsParams} for more details.
      #
      #   @param date_from [Time, nil] Filter by issue date (from)
      #
      #   @param date_to [Time, nil] Filter by issue date (to)
      #
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param receiver [String, nil] Filter by receiver (customer_name, customer_email, customer_tax_id, customer_com
      #
      #   @param search [String, nil] Search in invoice number, seller/buyer names
      #
      #   @param sender [String, nil] (Deprecated) Filter by sender ID
      #
      #   @param sort_by [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, EInvoiceAPI::Models::OutboxListReceivedDocumentsParams::SortOrder] Sort direction (asc/desc)
      #
      #   @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type. If not provided, returns all types.
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]

      # Field to sort by
      module SortBy
        extend EInvoiceAPI::Internal::Type::Enum

        CREATED_AT = :created_at
        INVOICE_DATE = :invoice_date
        DUE_DATE = :due_date
        INVOICE_TOTAL = :invoice_total
        CUSTOMER_NAME = :customer_name
        VENDOR_NAME = :vendor_name
        INVOICE_ID = :invoice_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Sort direction (asc/desc)
      module SortOrder
        extend EInvoiceAPI::Internal::Type::Enum

        ASC = :asc
        DESC = :desc

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
