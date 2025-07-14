# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Lookup#retrieve_participants
    class LookupRetrieveParticipantsResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute query_terms
      #   Query terms used for search
      #
      #   @return [String]
      required :query_terms, String

      # @!attribute search_date
      #   Search date of the result
      #
      #   @return [String]
      required :search_date, String

      # @!attribute total_count
      #   Total number of results
      #
      #   @return [Integer]
      required :total_count, Integer

      # @!attribute used_count
      #   Number of results returned by the API
      #
      #   @return [Integer]
      required :used_count, Integer

      # @!attribute participants
      #   List of participants
      #
      #   @return [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant>, nil]
      optional :participants,
               -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant] }

      # @!method initialize(query_terms:, search_date:, total_count:, used_count:, participants: nil)
      #   Represents the result of a Peppol directory search
      #
      #   @param query_terms [String] Query terms used for search
      #
      #   @param search_date [String] Search date of the result
      #
      #   @param total_count [Integer] Total number of results
      #
      #   @param used_count [Integer] Number of results returned by the API
      #
      #   @param participants [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant>] List of participants

      class Participant < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute peppol_id
        #   Peppol ID of the participant
        #
        #   @return [String]
        required :peppol_id, String

        # @!attribute peppol_scheme
        #   Peppol scheme of the participant
        #
        #   @return [String]
        required :peppol_scheme, String

        # @!attribute document_types
        #   List of supported document types
        #
        #   @return [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType>, nil]
        optional :document_types,
                 -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType] }

        # @!attribute entities
        #   List of business entities
        #
        #   @return [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity>, nil]
        optional :entities,
                 -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity] }

        # @!method initialize(peppol_id:, peppol_scheme:, document_types: nil, entities: nil)
        #   Represents a Peppol participant with their details
        #
        #   @param peppol_id [String] Peppol ID of the participant
        #
        #   @param peppol_scheme [String] Peppol scheme of the participant
        #
        #   @param document_types [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::DocumentType>] List of supported document types
        #
        #   @param entities [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity>] List of business entities

        class DocumentType < EInvoiceAPI::Internal::Type::BaseModel
          # @!attribute scheme
          #   Document type scheme
          #
          #   @return [String]
          required :scheme, String

          # @!attribute value
          #   Document type value
          #
          #   @return [String]
          required :value, String

          # @!method initialize(scheme:, value:)
          #   Represents a supported document type
          #
          #   @param scheme [String] Document type scheme
          #
          #   @param value [String] Document type value
        end

        class Entity < EInvoiceAPI::Internal::Type::BaseModel
          # @!attribute additional_info
          #   Additional information
          #
          #   @return [String, nil]
          optional :additional_info, String, nil?: true

          # @!attribute country_code
          #   Country code
          #
          #   @return [String, nil]
          optional :country_code, String, nil?: true

          # @!attribute geo_info
          #   Geographic information
          #
          #   @return [String, nil]
          optional :geo_info, String, nil?: true

          # @!attribute identifiers
          #   List of business identifiers
          #
          #   @return [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier>, nil]
          optional :identifiers,
                   -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier] }

          # @!attribute name
          #   Business entity name
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute registration_date
          #   Registration date
          #
          #   @return [String, nil]
          optional :registration_date, String, nil?: true

          # @!attribute website
          #   Website URL
          #
          #   @return [String, nil]
          optional :website, String, nil?: true

          # @!method initialize(additional_info: nil, country_code: nil, geo_info: nil, identifiers: nil, name: nil, registration_date: nil, website: nil)
          #   Represents a business entity
          #
          #   @param additional_info [String, nil] Additional information
          #
          #   @param country_code [String, nil] Country code
          #
          #   @param geo_info [String, nil] Geographic information
          #
          #   @param identifiers [Array<EInvoiceAPI::Models::LookupRetrieveParticipantsResponse::Participant::Entity::Identifier>] List of business identifiers
          #
          #   @param name [String, nil] Business entity name
          #
          #   @param registration_date [String, nil] Registration date
          #
          #   @param website [String, nil] Website URL

          class Identifier < EInvoiceAPI::Internal::Type::BaseModel
            # @!attribute scheme
            #   Identifier scheme
            #
            #   @return [String]
            required :scheme, String

            # @!attribute value
            #   Identifier value
            #
            #   @return [String]
            required :value, String

            # @!method initialize(scheme:, value:)
            #   Represents a business identifier
            #
            #   @param scheme [String] Identifier scheme
            #
            #   @param value [String] Identifier value
          end
        end
      end
    end
  end
end
