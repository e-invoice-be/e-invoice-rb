# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Outbox#list_draft_documents
    class OutboxListDraftDocumentsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

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

      # @!attribute search
      #   Search in invoice number, seller/buyer names
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute sort_by
      #   Field to sort by
      #
      #   @return [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortBy, nil]
      optional :sort_by, enum: -> { EInvoiceAPI::OutboxListDraftDocumentsParams::SortBy }

      # @!attribute sort_order
      #   Sort direction (asc/desc)
      #
      #   @return [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortOrder, nil]
      optional :sort_order, enum: -> { EInvoiceAPI::OutboxListDraftDocumentsParams::SortOrder }

      # @!attribute state
      #   Filter by document state
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentState, nil]
      optional :state, enum: -> { EInvoiceAPI::DocumentState }, nil?: true

      # @!attribute type
      #   Filter by document type
      #
      #   @return [Symbol, EInvoiceAPI::Models::DocumentType, nil]
      optional :type, enum: -> { EInvoiceAPI::DocumentType }, nil?: true

      # @!method initialize(page: nil, page_size: nil, search: nil, sort_by: nil, sort_order: nil, state: nil, type: nil, request_options: {})
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param search [String, nil] Search in invoice number, seller/buyer names
      #
      #   @param sort_by [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, EInvoiceAPI::Models::OutboxListDraftDocumentsParams::SortOrder] Sort direction (asc/desc)
      #
      #   @param state [Symbol, EInvoiceAPI::Models::DocumentState, nil] Filter by document state
      #
      #   @param type [Symbol, EInvoiceAPI::Models::DocumentType, nil] Filter by document type
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
