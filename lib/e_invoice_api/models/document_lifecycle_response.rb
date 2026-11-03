# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#lifecycle
    class DocumentLifecycleResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute document_id
      #
      #   @return [String]
      required :document_id, String

      # @!attribute events
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentLifecycleResponse::Event>]
      required :events,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::DocumentLifecycleResponse::Event] }

      # @!method initialize(document_id:, events:)
      #   @param document_id [String]
      #   @param events [Array<EInvoiceAPI::Models::DocumentLifecycleResponse::Event>]

      class Event < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute canonical_status
        #
        #   @return [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus, nil]
        required :canonical_status,
                 enum: -> { EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus },
                 nil?: true

        # @!attribute direction
        #
        #   @return [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction]
        required :direction, enum: -> { EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction }

        # @!attribute level
        #
        #   @return [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level]
        required :level, enum: -> { EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level }

        # @!attribute native_code
        #
        #   @return [String, nil]
        required :native_code, String, nil?: true

        # @!attribute occurred_at
        #
        #   @return [Time]
        required :occurred_at, Time

        # @!attribute reason
        #
        #   @return [String, nil]
        required :reason, String, nil?: true

        # @!attribute reason_code
        #
        #   @return [String, nil]
        required :reason_code, String, nil?: true

        # @!attribute source
        #
        #   @return [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source]
        required :source, enum: -> { EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source }

        # @!method initialize(canonical_status:, direction:, level:, native_code:, occurred_at:, reason:, reason_code:, source:)
        #   @param canonical_status [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus, nil]
        #   @param direction [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction]
        #   @param level [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level]
        #   @param native_code [String, nil]
        #   @param occurred_at [Time]
        #   @param reason [String, nil]
        #   @param reason_code [String, nil]
        #   @param source [Symbol, EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source]

        # @see EInvoiceAPI::Models::DocumentLifecycleResponse::Event#canonical_status
        module CanonicalStatus
          extend EInvoiceAPI::Internal::Type::Enum

          DEPOSITED = :deposited
          EMITTED = :emitted
          DELIVERED = :delivered
          REJECTED = :rejected
          ACKNOWLEDGED = :acknowledged
          APPROVED = :approved
          PARTIALLY_APPROVED = :partially_approved
          DISPUTED = :disputed
          ON_HOLD = :on_hold
          REFUSED = :refused
          PAYMENT_SENT = :payment_sent
          PAID = :paid

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see EInvoiceAPI::Models::DocumentLifecycleResponse::Event#direction
        module Direction
          extend EInvoiceAPI::Internal::Type::Enum

          IN = :in
          OUT = :out

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see EInvoiceAPI::Models::DocumentLifecycleResponse::Event#level
        module Level
          extend EInvoiceAPI::Internal::Type::Enum

          TRANSPORT = :transport
          BUSINESS = :business

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see EInvoiceAPI::Models::DocumentLifecycleResponse::Event#source
        module Source
          extend EInvoiceAPI::Internal::Type::Enum

          PEPPOL_MLR = :"peppol:mlr"
          PEPPOL_MLS = :"peppol:mls"
          PEPPOL_IMR = :"peppol:imr"
          FR_SUPERPDP = :"fr:superpdp"
          LOCAL = :local

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
