# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Mailbox#list
    class MailboxListParams < EInvoiceAPI::Internal::Type::BaseModel
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

      # @!attribute processed
      #   Filter by processing status. If not provided, returns all. Ignored when `status`
      #   is set.
      #
      #   @return [Boolean, nil]
      optional :processed, EInvoiceAPI::Internal::Type::Boolean, nil?: true

      # @!attribute received_from
      #   Inclusive lower bound on received date (falls back to created_at when
      #   received_at is null)
      #
      #   @return [Time, nil]
      optional :received_from, Time, nil?: true

      # @!attribute received_to
      #   Inclusive upper bound on received date (falls back to created_at when
      #   received_at is null)
      #
      #   @return [Time, nil]
      optional :received_to, Time, nil?: true

      # @!attribute search
      #   Case-insensitive search across sender email, subject, message ID, and attachment
      #   filenames
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute sort_by
      #   Field to sort by
      #
      #   @return [Symbol, EInvoiceAPI::Models::MailboxListParams::SortBy, nil]
      optional :sort_by, enum: -> { EInvoiceAPI::MailboxListParams::SortBy }

      # @!attribute sort_order
      #   Sort direction (asc/desc)
      #
      #   @return [Symbol, EInvoiceAPI::Models::MailboxListParams::SortOrder, nil]
      optional :sort_order, enum: -> { EInvoiceAPI::MailboxListParams::SortOrder }

      # @!attribute status
      #   Filter by status: pending, success, or failed. Takes precedence over `processed`
      #   if both are provided.
      #
      #   @return [Symbol, EInvoiceAPI::Models::MailboxListParams::Status, nil]
      optional :status, enum: -> { EInvoiceAPI::MailboxListParams::Status }, nil?: true

      # @!method initialize(page: nil, page_size: nil, processed: nil, received_from: nil, received_to: nil, search: nil, sort_by: nil, sort_order: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::MailboxListParams} for more details.
      #
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param processed [Boolean, nil] Filter by processing status. If not provided, returns all. Ignored when `status`
      #
      #   @param received_from [Time, nil] Inclusive lower bound on received date (falls back to created_at when received_a
      #
      #   @param received_to [Time, nil] Inclusive upper bound on received date (falls back to created_at when received_a
      #
      #   @param search [String, nil] Case-insensitive search across sender email, subject, message ID, and attachment
      #
      #   @param sort_by [Symbol, EInvoiceAPI::Models::MailboxListParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, EInvoiceAPI::Models::MailboxListParams::SortOrder] Sort direction (asc/desc)
      #
      #   @param status [Symbol, EInvoiceAPI::Models::MailboxListParams::Status, nil] Filter by status: pending, success, or failed. Takes precedence over `processed`
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]

      # Field to sort by
      module SortBy
        extend EInvoiceAPI::Internal::Type::Enum

        RECEIVED_AT = :received_at
        CREATED_AT = :created_at

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

      # Filter by status: pending, success, or failed. Takes precedence over `processed`
      # if both are provided.
      module Status
        extend EInvoiceAPI::Internal::Type::Enum

        PENDING = :pending
        SUCCESS = :success
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
