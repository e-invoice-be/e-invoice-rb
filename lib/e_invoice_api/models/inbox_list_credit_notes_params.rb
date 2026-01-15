# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Inbox#list_credit_notes
    class InboxListCreditNotesParams < EInvoiceAPI::Internal::Type::BaseModel
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

      # @!attribute sort_by
      #   Field to sort by
      #
      #   @return [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortBy, nil]
      optional :sort_by, enum: -> { EInvoiceAPI::InboxListCreditNotesParams::SortBy }

      # @!attribute sort_order
      #   Sort direction (asc/desc)
      #
      #   @return [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortOrder, nil]
      optional :sort_order, enum: -> { EInvoiceAPI::InboxListCreditNotesParams::SortOrder }

      # @!method initialize(page: nil, page_size: nil, sort_by: nil, sort_order: nil, request_options: {})
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param sort_by [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, EInvoiceAPI::Models::InboxListCreditNotesParams::SortOrder] Sort direction (asc/desc)
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
