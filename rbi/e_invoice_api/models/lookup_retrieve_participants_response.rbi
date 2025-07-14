# typed: strong

module EInvoiceAPI
  module Models
    class LookupRetrieveParticipantsResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::LookupRetrieveParticipantsResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Query terms used for search
      sig { returns(String) }
      attr_accessor :query_terms

      # Search date of the result
      sig { returns(String) }
      attr_accessor :search_date

      # Total number of results
      sig { returns(Integer) }
      attr_accessor :total_count

      # Number of results returned by the API
      sig { returns(Integer) }
      attr_accessor :used_count

      # List of participants
      sig do
        returns(
          T.nilable(
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant
            ]
          )
        )
      end
      attr_reader :participants

      sig do
        params(
          participants:
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::OrHash
            ]
        ).void
      end
      attr_writer :participants

      # Represents the result of a Peppol directory search
      sig do
        params(
          query_terms: String,
          search_date: String,
          total_count: Integer,
          used_count: Integer,
          participants:
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # Query terms used for search
        query_terms:,
        # Search date of the result
        search_date:,
        # Total number of results
        total_count:,
        # Number of results returned by the API
        used_count:,
        # List of participants
        participants: nil
      )
      end

      sig do
        override.returns(
          {
            query_terms: String,
            search_date: String,
            total_count: Integer,
            used_count: Integer,
            participants:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant
              ]
          }
        )
      end
      def to_hash
      end

      class Participant < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # Peppol ID of the participant
        sig { returns(String) }
        attr_accessor :peppol_id

        # Peppol scheme of the participant
        sig { returns(String) }
        attr_accessor :peppol_scheme

        # List of supported document types
        sig do
          returns(
            T.nilable(
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType
              ]
            )
          )
        end
        attr_reader :document_types

        sig do
          params(
            document_types:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType::OrHash
              ]
          ).void
        end
        attr_writer :document_types

        # List of business entities
        sig do
          returns(
            T.nilable(
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity
              ]
            )
          )
        end
        attr_reader :entities

        sig do
          params(
            entities:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::OrHash
              ]
          ).void
        end
        attr_writer :entities

        # Represents a Peppol participant with their details
        sig do
          params(
            peppol_id: String,
            peppol_scheme: String,
            document_types:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType::OrHash
              ],
            entities:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Peppol ID of the participant
          peppol_id:,
          # Peppol scheme of the participant
          peppol_scheme:,
          # List of supported document types
          document_types: nil,
          # List of business entities
          entities: nil
        )
        end

        sig do
          override.returns(
            {
              peppol_id: String,
              peppol_scheme: String,
              document_types:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType
                ],
              entities:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity
                ]
            }
          )
        end
        def to_hash
        end

        class DocumentType < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # Document type scheme
          sig { returns(String) }
          attr_accessor :scheme

          # Document type value
          sig { returns(String) }
          attr_accessor :value

          # Represents a supported document type
          sig do
            params(scheme: String, value: String).returns(T.attached_class)
          end
          def self.new(
            # Document type scheme
            scheme:,
            # Document type value
            value:
          )
          end

          sig { override.returns({ scheme: String, value: String }) }
          def to_hash
          end
        end

        class Entity < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # Additional information
          sig { returns(T.nilable(String)) }
          attr_accessor :additional_info

          # Country code
          sig { returns(T.nilable(String)) }
          attr_accessor :country_code

          # Geographic information
          sig { returns(T.nilable(String)) }
          attr_accessor :geo_info

          # List of business identifiers
          sig do
            returns(
              T.nilable(
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier
                ]
              )
            )
          end
          attr_reader :identifiers

          sig do
            params(
              identifiers:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier::OrHash
                ]
            ).void
          end
          attr_writer :identifiers

          # Business entity name
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Registration date
          sig { returns(T.nilable(String)) }
          attr_accessor :registration_date

          # Website URL
          sig { returns(T.nilable(String)) }
          attr_accessor :website

          # Represents a business entity
          sig do
            params(
              additional_info: T.nilable(String),
              country_code: T.nilable(String),
              geo_info: T.nilable(String),
              identifiers:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier::OrHash
                ],
              name: T.nilable(String),
              registration_date: T.nilable(String),
              website: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Additional information
            additional_info: nil,
            # Country code
            country_code: nil,
            # Geographic information
            geo_info: nil,
            # List of business identifiers
            identifiers: nil,
            # Business entity name
            name: nil,
            # Registration date
            registration_date: nil,
            # Website URL
            website: nil
          )
          end

          sig do
            override.returns(
              {
                additional_info: T.nilable(String),
                country_code: T.nilable(String),
                geo_info: T.nilable(String),
                identifiers:
                  T::Array[
                    EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier
                  ],
                name: T.nilable(String),
                registration_date: T.nilable(String),
                website: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class Identifier < EInvoiceAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier,
                  EInvoiceAPI::Internal::AnyHash
                )
              end

            # Identifier scheme
            sig { returns(String) }
            attr_accessor :scheme

            # Identifier value
            sig { returns(String) }
            attr_accessor :value

            # Represents a business identifier
            sig do
              params(scheme: String, value: String).returns(T.attached_class)
            end
            def self.new(
              # Identifier scheme
              scheme:,
              # Identifier value
              value:
            )
            end

            sig { override.returns({ scheme: String, value: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
