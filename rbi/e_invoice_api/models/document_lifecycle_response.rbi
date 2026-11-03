# typed: strong

module EInvoiceAPI
  module Models
    class DocumentLifecycleResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::DocumentLifecycleResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :document_id

      sig do
        returns(T::Array[EInvoiceAPI::Models::DocumentLifecycleResponse::Event])
      end
      attr_accessor :events

      sig do
        params(
          document_id: String,
          events:
            T::Array[
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::OrHash
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
              T::Array[EInvoiceAPI::Models::DocumentLifecycleResponse::Event]
          }
        )
      end
      def to_hash
      end

      class Event < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          )
        end
        attr_accessor :canonical_status

        sig do
          returns(
            EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::TaggedSymbol
          )
        end
        attr_accessor :direction

        sig do
          returns(
            EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::TaggedSymbol
          )
        end
        attr_accessor :level

        sig { returns(T.nilable(String)) }
        attr_accessor :native_code

        sig { returns(Time) }
        attr_accessor :occurred_at

        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

        sig do
          returns(
            EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
          )
        end
        attr_accessor :source

        sig do
          params(
            canonical_status:
              T.nilable(
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::OrSymbol
              ),
            direction:
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::OrSymbol,
            level:
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::OrSymbol,
            native_code: T.nilable(String),
            occurred_at: Time,
            reason: T.nilable(String),
            reason_code: T.nilable(String),
            source:
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          canonical_status:,
          direction:,
          level:,
          native_code:,
          occurred_at:,
          reason:,
          reason_code:,
          source:
        )
        end

        sig do
          override.returns(
            {
              canonical_status:
                T.nilable(
                  EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
                ),
              direction:
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::TaggedSymbol,
              level:
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::TaggedSymbol,
              native_code: T.nilable(String),
              occurred_at: Time,
              reason: T.nilable(String),
              reason_code: T.nilable(String),
              source:
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module CanonicalStatus
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEPOSITED =
            T.let(
              :deposited,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          EMITTED =
            T.let(
              :emitted,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          ACKNOWLEDGED =
            T.let(
              :acknowledged,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          APPROVED =
            T.let(
              :approved,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          PARTIALLY_APPROVED =
            T.let(
              :partially_approved,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          DISPUTED =
            T.let(
              :disputed,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          ON_HOLD =
            T.let(
              :on_hold,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          REFUSED =
            T.let(
              :refused,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          PAYMENT_SENT =
            T.let(
              :payment_sent,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )
          PAID =
            T.let(
              :paid,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::CanonicalStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Direction
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IN =
            T.let(
              :in,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::TaggedSymbol
            )
          OUT =
            T.let(
              :out,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Direction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Level
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRANSPORT =
            T.let(
              :transport,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::TaggedSymbol
            )
          BUSINESS =
            T.let(
              :business,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Level::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Source
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PEPPOL_MLR =
            T.let(
              :"peppol:mlr",
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            )
          PEPPOL_MLS =
            T.let(
              :"peppol:mls",
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            )
          PEPPOL_IMR =
            T.let(
              :"peppol:imr",
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            )
          FR_SUPERPDP =
            T.let(
              :"fr:superpdp",
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            )
          LOCAL =
            T.let(
              :local,
              EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Models::DocumentLifecycleResponse::Event::Source::TaggedSymbol
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
