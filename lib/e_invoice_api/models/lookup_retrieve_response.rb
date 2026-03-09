# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Lookup#retrieve
    class LookupRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute business_card
      #   Business card information for the Peppol participant
      #
      #   @return [EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard]
      required :business_card,
               -> { EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard },
               api_name: :businessCard

      # @!attribute certificates
      #   List of certificates found for the Peppol participant
      #
      #   @return [Array<EInvoiceAPI::Models::Certificate>]
      required :certificates, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Certificate] }

      # @!attribute dns_info
      #   Information about the DNS lookup performed
      #
      #   @return [EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo]
      required :dns_info, -> { EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo }, api_name: :dnsInfo

      # @!attribute errors
      #   List of error messages if any errors occurred during the lookup
      #
      #   @return [Array<String>]
      required :errors, EInvoiceAPI::Internal::Type::ArrayOf[String]

      # @!attribute execution_time_ms
      #   Total execution time of the lookup operation in milliseconds
      #
      #   @return [Float]
      required :execution_time_ms, Float, api_name: :executionTimeMs

      # @!attribute query_metadata
      #   Metadata about the query that was performed
      #
      #   @return [EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata]
      required :query_metadata,
               -> { EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata },
               api_name: :queryMetadata

      # @!attribute service_metadata
      #   Service metadata information for the Peppol participant
      #
      #   @return [EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata]
      required :service_metadata,
               -> { EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata },
               api_name: :serviceMetadata

      # @!attribute status
      #   Overall status of the lookup: 'success' or 'error'
      #
      #   @return [String]
      required :status, String

      # @!method initialize(business_card:, certificates:, dns_info:, errors:, execution_time_ms:, query_metadata:, service_metadata:, status:)
      #   Response from a Peppol ID lookup operation.
      #
      #   This model represents the complete result of validating and looking up a Peppol
      #   ID in the Peppol network, including DNS information, service metadata, business
      #   card details, and certificate information.
      #
      #   Example: A successful lookup for a Peppol ID "0192:991825827" would return DNS
      #   information, service metadata with supported document types and processes,
      #   business card information with organization details, and certificate data.
      #
      #   @param business_card [EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard] Business card information for the Peppol participant
      #
      #   @param certificates [Array<EInvoiceAPI::Models::Certificate>] List of certificates found for the Peppol participant
      #
      #   @param dns_info [EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo] Information about the DNS lookup performed
      #
      #   @param errors [Array<String>] List of error messages if any errors occurred during the lookup
      #
      #   @param execution_time_ms [Float] Total execution time of the lookup operation in milliseconds
      #
      #   @param query_metadata [EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata] Metadata about the query that was performed
      #
      #   @param service_metadata [EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata] Service metadata information for the Peppol participant
      #
      #   @param status [String] Overall status of the lookup: 'success' or 'error'

      # @see EInvoiceAPI::Models::LookupRetrieveResponse#business_card
      class BusinessCard < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute entities
        #   List of business entities associated with the Peppol ID
        #
        #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity>]
        required :entities,
                 -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity] }

        # @!attribute query_time_ms
        #   Time taken to query the business card in milliseconds
        #
        #   @return [Float]
        required :query_time_ms, Float, api_name: :queryTimeMs

        # @!attribute status
        #   Status of the business card lookup: 'success', 'error', or 'pending'
        #
        #   @return [String]
        required :status, String

        # @!attribute error
        #   Error message if business card lookup failed
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!method initialize(entities:, query_time_ms:, status:, error: nil)
        #   Business card information for the Peppol participant
        #
        #   @param entities [Array<EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity>] List of business entities associated with the Peppol ID
        #
        #   @param query_time_ms [Float] Time taken to query the business card in milliseconds
        #
        #   @param status [String] Status of the business card lookup: 'success', 'error', or 'pending'
        #
        #   @param error [String, nil] Error message if business card lookup failed

        class Entity < EInvoiceAPI::Internal::Type::BaseModel
          # @!attribute additional_information
          #   Additional information about the business entity
          #
          #   @return [Array<String>, nil]
          optional :additional_information,
                   EInvoiceAPI::Internal::Type::ArrayOf[String],
                   api_name: :additionalInformation,
                   nil?: true

          # @!attribute country_code
          #   ISO 3166-1 alpha-2 country code of the business entity
          #
          #   @return [String, nil]
          optional :country_code, String, api_name: :countryCode, nil?: true

          # @!attribute name
          #   Name of the business entity
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute registration_date
          #   ISO 8601 date of when the entity was registered in Peppol
          #
          #   @return [String, nil]
          optional :registration_date, String, api_name: :registrationDate, nil?: true

          # @!method initialize(additional_information: nil, country_code: nil, name: nil, registration_date: nil)
          #   Business entity information in the Peppol network.
          #
          #   @param additional_information [Array<String>, nil] Additional information about the business entity
          #
          #   @param country_code [String, nil] ISO 3166-1 alpha-2 country code of the business entity
          #
          #   @param name [String, nil] Name of the business entity
          #
          #   @param registration_date [String, nil] ISO 8601 date of when the entity was registered in Peppol
        end
      end

      # @see EInvoiceAPI::Models::LookupRetrieveResponse#dns_info
      class DNSInfo < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute dns_records
        #   List of DNS records found for the Peppol participant
        #
        #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord>]
        required :dns_records,
                 -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord] },
                 api_name: :dnsRecords

        # @!attribute sml_hostname
        #   Hostname of the SML used for the query
        #
        #   @return [String]
        required :sml_hostname, String, api_name: :smlHostname

        # @!attribute status
        #   Status of the DNS lookup: 'success', 'error', or 'pending'
        #
        #   @return [String]
        required :status, String

        # @!attribute error
        #   Error message if the DNS lookup failed
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!attribute lookup_method
        #   DNS lookup method used: 'naptr' (new spec) or 'busdox' (legacy)
        #
        #   @return [String, nil]
        optional :lookup_method, String, api_name: :lookupMethod, nil?: true

        # @!attribute smp_hostname
        #   Hostname of the SMP (Service Metadata Publisher) discovered via DNS
        #
        #   @return [String, nil]
        optional :smp_hostname, String, api_name: :smpHostname, nil?: true

        # @!method initialize(dns_records:, sml_hostname:, status:, error: nil, lookup_method: nil, smp_hostname: nil)
        #   Information about the DNS lookup performed
        #
        #   @param dns_records [Array<EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord>] List of DNS records found for the Peppol participant
        #
        #   @param sml_hostname [String] Hostname of the SML used for the query
        #
        #   @param status [String] Status of the DNS lookup: 'success', 'error', or 'pending'
        #
        #   @param error [String, nil] Error message if the DNS lookup failed
        #
        #   @param lookup_method [String, nil] DNS lookup method used: 'naptr' (new spec) or 'busdox' (legacy)
        #
        #   @param smp_hostname [String, nil] Hostname of the SMP (Service Metadata Publisher) discovered via DNS

        class DNSRecord < EInvoiceAPI::Internal::Type::BaseModel
          # @!attribute ip
          #   IP address found in the DNS record
          #
          #   @return [String]
          required :ip, String

          # @!method initialize(ip:)
          #   DNS record information for a Peppol participant.
          #
          #   @param ip [String] IP address found in the DNS record
        end
      end

      # @see EInvoiceAPI::Models::LookupRetrieveResponse#query_metadata
      class QueryMetadata < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute identifier_scheme
        #   Scheme of the identifier, typically 'iso6523-actorid-upis'
        #
        #   @return [String]
        required :identifier_scheme, String, api_name: :identifierScheme

        # @!attribute identifier_value
        #   The actual Peppol ID value being queried
        #
        #   @return [String]
        required :identifier_value, String, api_name: :identifierValue

        # @!attribute sml_domain
        #   Domain of the SML (Service Metadata Locator) used for the lookup
        #
        #   @return [String]
        required :sml_domain, String, api_name: :smlDomain

        # @!attribute timestamp
        #   ISO 8601 timestamp of when the query was executed
        #
        #   @return [String]
        required :timestamp, String

        # @!attribute version
        #   Version of the API used for the lookup
        #
        #   @return [String]
        required :version, String

        # @!method initialize(identifier_scheme:, identifier_value:, sml_domain:, timestamp:, version:)
        #   Metadata about the query that was performed
        #
        #   @param identifier_scheme [String] Scheme of the identifier, typically 'iso6523-actorid-upis'
        #
        #   @param identifier_value [String] The actual Peppol ID value being queried
        #
        #   @param sml_domain [String] Domain of the SML (Service Metadata Locator) used for the lookup
        #
        #   @param timestamp [String] ISO 8601 timestamp of when the query was executed
        #
        #   @param version [String] Version of the API used for the lookup
      end

      # @see EInvoiceAPI::Models::LookupRetrieveResponse#service_metadata
      class ServiceMetadata < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute endpoints
        #   List of endpoints found for the Peppol participant
        #
        #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint>]
        required :endpoints,
                 -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint] }

        # @!attribute query_time_ms
        #   Time taken to query the service metadata in milliseconds
        #
        #   @return [Float]
        required :query_time_ms, Float, api_name: :queryTimeMs

        # @!attribute status
        #   Status of the service metadata lookup: 'success', 'error', or 'pending'
        #
        #   @return [String]
        required :status, String

        # @!attribute error
        #   Error message if service metadata lookup failed
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!method initialize(endpoints:, query_time_ms:, status:, error: nil)
        #   Service metadata information for the Peppol participant
        #
        #   @param endpoints [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint>] List of endpoints found for the Peppol participant
        #
        #   @param query_time_ms [Float] Time taken to query the service metadata in milliseconds
        #
        #   @param status [String] Status of the service metadata lookup: 'success', 'error', or 'pending'
        #
        #   @param error [String, nil] Error message if service metadata lookup failed

        class Endpoint < EInvoiceAPI::Internal::Type::BaseModel
          # @!attribute document_types
          #   List of document types supported by this endpoint
          #
          #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType>]
          required :document_types,
                   -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType] },
                   api_name: :documentTypes

          # @!attribute status
          #   Status of the endpoint lookup: 'success', 'error', or 'pending'
          #
          #   @return [String]
          required :status, String

          # @!attribute url
          #   URL of the endpoint
          #
          #   @return [String]
          required :url, String

          # @!attribute error
          #   Error message if endpoint lookup failed
          #
          #   @return [String, nil]
          optional :error, String, nil?: true

          # @!attribute processes
          #   List of processes supported by this endpoint
          #
          #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process>, nil]
          optional :processes,
                   -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process] },
                   nil?: true

          # @!method initialize(document_types:, status:, url:, error: nil, processes: nil)
          #   Information about a Peppol participant's endpoint.
          #
          #   @param document_types [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType>] List of document types supported by this endpoint
          #
          #   @param status [String] Status of the endpoint lookup: 'success', 'error', or 'pending'
          #
          #   @param url [String] URL of the endpoint
          #
          #   @param error [String, nil] Error message if endpoint lookup failed
          #
          #   @param processes [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process>, nil] List of processes supported by this endpoint

          class DocumentType < EInvoiceAPI::Internal::Type::BaseModel
            # @!attribute scheme
            #   Scheme of the document type identifier
            #
            #   @return [String]
            required :scheme, String

            # @!attribute value
            #   Value of the document type identifier
            #
            #   @return [String]
            required :value, String

            # @!method initialize(scheme:, value:)
            #   Document type supported by a Peppol participant.
            #
            #   @param scheme [String] Scheme of the document type identifier
            #
            #   @param value [String] Value of the document type identifier
          end

          class Process < EInvoiceAPI::Internal::Type::BaseModel
            # @!attribute endpoints
            #   List of endpoints supporting this process
            #
            #   @return [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint>]
            required :endpoints,
                     -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint] }

            # @!attribute process_id
            #   Identifier of the process
            #
            #   @return [EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID]
            required :process_id,
                     -> { EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID },
                     api_name: :processId

            # @!method initialize(endpoints:, process_id:)
            #   Process information in the Peppol network.
            #
            #   @param endpoints [Array<EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint>] List of endpoints supporting this process
            #
            #   @param process_id [EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID] Identifier of the process

            class Endpoint < EInvoiceAPI::Internal::Type::BaseModel
              # @!attribute address
              #   URL or address of the endpoint
              #
              #   @return [String]
              required :address, String

              # @!attribute transport_profile
              #   Transport profile used by this endpoint
              #
              #   @return [String]
              required :transport_profile, String, api_name: :transportProfile

              # @!attribute certificate
              #   Certificate information for a Peppol endpoint.
              #
              #   @return [EInvoiceAPI::Models::Certificate, nil]
              optional :certificate, -> { EInvoiceAPI::Certificate }, nil?: true

              # @!attribute service_activation_date
              #   ISO 8601 date when the service was activated
              #
              #   @return [String, nil]
              optional :service_activation_date, String, api_name: :serviceActivationDate, nil?: true

              # @!attribute service_description
              #   Human-readable description of the service
              #
              #   @return [String, nil]
              optional :service_description, String, api_name: :serviceDescription, nil?: true

              # @!attribute service_expiration_date
              #   ISO 8601 date when the service will expire
              #
              #   @return [String, nil]
              optional :service_expiration_date, String, api_name: :serviceExpirationDate, nil?: true

              # @!attribute technical_contact_url
              #   URL for technical contact information
              #
              #   @return [String, nil]
              optional :technical_contact_url, String, api_name: :technicalContactUrl, nil?: true

              # @!attribute technical_information_url
              #   URL for technical documentation
              #
              #   @return [String, nil]
              optional :technical_information_url, String, api_name: :technicalInformationUrl, nil?: true

              # @!method initialize(address:, transport_profile:, certificate: nil, service_activation_date: nil, service_description: nil, service_expiration_date: nil, technical_contact_url: nil, technical_information_url: nil)
              #   Endpoint information for a specific Peppol process.
              #
              #   @param address [String] URL or address of the endpoint
              #
              #   @param transport_profile [String] Transport profile used by this endpoint
              #
              #   @param certificate [EInvoiceAPI::Models::Certificate, nil] Certificate information for a Peppol endpoint.
              #
              #   @param service_activation_date [String, nil] ISO 8601 date when the service was activated
              #
              #   @param service_description [String, nil] Human-readable description of the service
              #
              #   @param service_expiration_date [String, nil] ISO 8601 date when the service will expire
              #
              #   @param technical_contact_url [String, nil] URL for technical contact information
              #
              #   @param technical_information_url [String, nil] URL for technical documentation
            end

            # @see EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process#process_id
            class ProcessID < EInvoiceAPI::Internal::Type::BaseModel
              # @!attribute scheme
              #   Scheme of the process identifier
              #
              #   @return [String]
              required :scheme, String

              # @!attribute value
              #   Value of the process identifier
              #
              #   @return [String]
              required :value, String

              # @!method initialize(scheme:, value:)
              #   Identifier of the process
              #
              #   @param scheme [String] Scheme of the process identifier
              #
              #   @param value [String] Value of the process identifier
            end
          end
        end
      end
    end
  end
end
