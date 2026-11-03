# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#timeline
    class DocumentTimelineResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute document_id
      #
      #   @return [String]
      required :document_id, String

      # @!attribute events
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentTimelineResponse::Event>]
      required :events,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentTimelineResponse::Event] }

      # @!method initialize(document_id:, events:)
      #   @param document_id [String]
      #   @param events [Array<EInvoiceAPI::Models::DocumentTimelineResponse::Event>]

      class Event < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute event_type
        #
        #   @return [Symbol, EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType]
        required :event_type, enum: -> { EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType }

        # @!attribute timestamp
        #
        #   @return [Time]
        required :timestamp, Time

        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute details
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :details,
                 EInvoiceAPI::Internal::Type::HashOf[EInvoiceAPI::Internal::Type::Unknown],
                 nil?: true

        # @!method initialize(event_type:, timestamp:, id: nil, details: nil)
        #   @param event_type [Symbol, EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType]
        #   @param timestamp [Time]
        #   @param id [String, nil]
        #   @param details [Hash{Symbol=>Object}, nil]

        # @see EInvoiceAPI::Models::DocumentTimelineResponse::Event#event_type
        module EventType
          extend EInvoiceAPI::Internal::Type::Enum

          EMAIL_RECEIVED = :email_received
          EMAIL_PROCESSED = :email_processed
          DOCUMENT_CREATED = :document_created
          SEND_ATTEMPTED = :send_attempted
          SEND_FAILED = :send_failed
          SEND_SUCCESS = :send_success
          RECEIVE_SUCCESS = :receive_success
          MLR_RECEIVED = :mlr_received
          IMR_RECEIVED = :imr_received

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
