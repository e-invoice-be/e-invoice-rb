# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Outbox#list_received_documents
    class OutboxListReceivedDocumentsParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

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

      # @!attribute search
      #   Search in invoice number, seller/buyer names
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute sender
      #   Filter by sender ID
      #
      #   @return [String, nil]
      optional :sender, String, nil?: true

      # @!attribute state
      #   Filter by document state
      #
      #   @return [Symbol, EInvoice::Models::DocumentState, nil]
      optional :state, enum: -> { EInvoice::DocumentState }, nil?: true

      # @!attribute type
      #   Filter by document type
      #
      #   @return [Symbol, EInvoice::Models::DocumentType, nil]
      optional :type, enum: -> { EInvoice::DocumentType }, nil?: true

      # @!method initialize(date_from: nil, date_to: nil, page: nil, page_size: nil, search: nil, sender: nil, state: nil, type: nil, request_options: {})
      #   @param date_from [Time, nil] Filter by issue date (from)
      #
      #   @param date_to [Time, nil] Filter by issue date (to)
      #
      #   @param page [Integer] Page number
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param search [String, nil] Search in invoice number, seller/buyer names
      #
      #   @param sender [String, nil] Filter by sender ID
      #
      #   @param state [Symbol, EInvoice::Models::DocumentState, nil] Filter by document state
      #
      #   @param type [Symbol, EInvoice::Models::DocumentType, nil] Filter by document type
      #
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
