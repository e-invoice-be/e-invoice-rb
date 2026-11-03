# typed: strong

module EInvoiceAPI
  module Models
    class DocumentTimelineResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::DocumentTimelineResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :document_id

      sig do
        returns(T::Array[EInvoiceAPI::Models::DocumentTimelineResponse::Event])
      end
      attr_accessor :events

      sig do
        params(
          document_id: String,
          events:
            T::Array[
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(document_id:, events:)
      end

      sig do
        override.returns(
          {
            document_id: String,
            events:
              T::Array[EInvoiceAPI::Models::DocumentTimelineResponse::Event]
          }
        )
      end
      def to_hash
      end

      class Event < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::DocumentTimelineResponse::Event,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
          )
        end
        attr_accessor :event_type

        sig { returns(Time) }
        attr_accessor :timestamp

        sig { returns(T.nilable(String)) }
        attr_accessor :id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :details

        sig do
          params(
            event_type:
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::OrSymbol,
            timestamp: Time,
            id: T.nilable(String),
            details: T.nilable(T::Hash[Symbol, T.anything])
          ).returns(T.attached_class)
        end
        def self.new(event_type:, timestamp:, id: nil, details: nil)
        end

        sig do
          override.returns(
            {
              event_type:
                EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol,
              timestamp: Time,
              id: T.nilable(String),
              details: T.nilable(T::Hash[Symbol, T.anything])
            }
          )
        end
        def to_hash
        end

        module EventType
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EMAIL_RECEIVED =
            T.let(
              :email_received,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          EMAIL_PROCESSED =
            T.let(
              :email_processed,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          DOCUMENT_CREATED =
            T.let(
              :document_created,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          SEND_ATTEMPTED =
            T.let(
              :send_attempted,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          SEND_FAILED =
            T.let(
              :send_failed,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          SEND_SUCCESS =
            T.let(
              :send_success,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          RECEIVE_SUCCESS =
            T.let(
              :receive_success,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          MLR_RECEIVED =
            T.let(
              :mlr_received,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )
          IMR_RECEIVED =
            T.let(
              :imr_received,
              EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::DocumentTimelineResponse::Event::EventType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
