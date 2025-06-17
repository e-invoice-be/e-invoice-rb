# typed: strong

module EInvoiceAPI
  module Models
    class LookupRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::LookupRetrieveResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Business card information for the Peppol participant
      sig { returns(EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard) }
      attr_reader :business_card

      sig do
        params(
          business_card:
            EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::OrHash
        ).void
      end
      attr_writer :business_card

      # List of certificates found for the Peppol participant
      sig { returns(T::Array[EInvoiceAPI::Certificate]) }
      attr_accessor :certificates

      # Information about the DNS lookup performed
      sig { returns(EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo) }
      attr_reader :dns_info

      sig do
        params(
          dns_info: EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::OrHash
        ).void
      end
      attr_writer :dns_info

      # List of error messages if any errors occurred during the lookup
      sig { returns(T::Array[String]) }
      attr_accessor :errors

      # Total execution time of the lookup operation in milliseconds
      sig { returns(Float) }
      attr_accessor :execution_time_ms

      # Metadata about the query that was performed
      sig do
        returns(EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata)
      end
      attr_reader :query_metadata

      sig do
        params(
          query_metadata:
            EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata::OrHash
        ).void
      end
      attr_writer :query_metadata

      # Service metadata information for the Peppol participant
      sig do
        returns(EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata)
      end
      attr_reader :service_metadata

      sig do
        params(
          service_metadata:
            EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::OrHash
        ).void
      end
      attr_writer :service_metadata

      # Overall status of the lookup: 'success' or 'error'
      sig { returns(String) }
      attr_accessor :status

      # Response from a Peppol ID lookup operation.
      #
      # This model represents the complete result of validating and looking up a Peppol
      # ID in the Peppol network, including DNS information, service metadata, business
      # card details, and certificate information.
      #
      # Example: A successful lookup for a Peppol ID "0192:991825827" would return DNS
      # information, service metadata with supported document types and processes,
      # business card information with organization details, and certificate data.
      sig do
        params(
          business_card:
            EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::OrHash,
          certificates: T::Array[EInvoiceAPI::Certificate::OrHash],
          dns_info:
            EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::OrHash,
          errors: T::Array[String],
          execution_time_ms: Float,
          query_metadata:
            EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata::OrHash,
          service_metadata:
            EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::OrHash,
          status: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Business card information for the Peppol participant
        business_card:,
        # List of certificates found for the Peppol participant
        certificates:,
        # Information about the DNS lookup performed
        dns_info:,
        # List of error messages if any errors occurred during the lookup
        errors:,
        # Total execution time of the lookup operation in milliseconds
        execution_time_ms:,
        # Metadata about the query that was performed
        query_metadata:,
        # Service metadata information for the Peppol participant
        service_metadata:,
        # Overall status of the lookup: 'success' or 'error'
        status:
      )
      end

      sig do
        override.returns(
          {
            business_card:
              EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard,
            certificates: T::Array[EInvoiceAPI::Certificate],
            dns_info: EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo,
            errors: T::Array[String],
            execution_time_ms: Float,
            query_metadata:
              EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata,
            service_metadata:
              EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata,
            status: String
          }
        )
      end
      def to_hash
      end

      class BusinessCard < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # List of business entities associated with the Peppol ID
        sig do
          returns(
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity
            ]
          )
        end
        attr_accessor :entities

        # Time taken to query the business card in milliseconds
        sig { returns(Float) }
        attr_accessor :query_time_ms

        # Status of the business card lookup: 'success', 'error', or 'pending'
        sig { returns(String) }
        attr_accessor :status

        # Error message if business card lookup failed
        sig { returns(T.nilable(String)) }
        attr_accessor :error

        # Business card information for the Peppol participant
        sig do
          params(
            entities:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity::OrHash
              ],
            query_time_ms: Float,
            status: String,
            error: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # List of business entities associated with the Peppol ID
          entities:,
          # Time taken to query the business card in milliseconds
          query_time_ms:,
          # Status of the business card lookup: 'success', 'error', or 'pending'
          status:,
          # Error message if business card lookup failed
          error: nil
        )
        end

        sig do
          override.returns(
            {
              entities:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity
                ],
              query_time_ms: Float,
              status: String,
              error: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Entity < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::Models::LookupRetrieveResponse::BusinessCard::Entity,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # Additional information about the business entity
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :additional_information

          # ISO 3166-1 alpha-2 country code of the business entity
          sig { returns(T.nilable(String)) }
          attr_accessor :country_code

          # Name of the business entity
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # ISO 8601 date of when the entity was registered in Peppol
          sig { returns(T.nilable(String)) }
          attr_accessor :registration_date

          # Business entity information in the Peppol network.
          sig do
            params(
              additional_information: T.nilable(T::Array[String]),
              country_code: T.nilable(String),
              name: T.nilable(String),
              registration_date: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Additional information about the business entity
            additional_information: nil,
            # ISO 3166-1 alpha-2 country code of the business entity
            country_code: nil,
            # Name of the business entity
            name: nil,
            # ISO 8601 date of when the entity was registered in Peppol
            registration_date: nil
          )
          end

          sig do
            override.returns(
              {
                additional_information: T.nilable(T::Array[String]),
                country_code: T.nilable(String),
                name: T.nilable(String),
                registration_date: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      class DNSInfo < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # List of DNS records found for the Peppol participant
        sig do
          returns(
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord
            ]
          )
        end
        attr_accessor :dns_records

        # Hostname of the SML used for the query
        sig { returns(String) }
        attr_accessor :sml_hostname

        # Status of the DNS lookup: 'success', 'error', or 'pending'
        sig { returns(String) }
        attr_accessor :status

        # Error message if the DNS lookup failed
        sig { returns(T.nilable(String)) }
        attr_accessor :error

        # Information about the DNS lookup performed
        sig do
          params(
            dns_records:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord::OrHash
              ],
            sml_hostname: String,
            status: String,
            error: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # List of DNS records found for the Peppol participant
          dns_records:,
          # Hostname of the SML used for the query
          sml_hostname:,
          # Status of the DNS lookup: 'success', 'error', or 'pending'
          status:,
          # Error message if the DNS lookup failed
          error: nil
        )
        end

        sig do
          override.returns(
            {
              dns_records:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord
                ],
              sml_hostname: String,
              status: String,
              error: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class DNSRecord < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::Models::LookupRetrieveResponse::DNSInfo::DNSRecord,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # IP address found in the DNS record
          sig { returns(String) }
          attr_accessor :ip

          # DNS record information for a Peppol participant.
          sig { params(ip: String).returns(T.attached_class) }
          def self.new(
            # IP address found in the DNS record
            ip:
          )
          end

          sig { override.returns({ ip: String }) }
          def to_hash
          end
        end
      end

      class QueryMetadata < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::LookupRetrieveResponse::QueryMetadata,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # Scheme of the identifier, typically 'iso6523-actorid-upis'
        sig { returns(String) }
        attr_accessor :identifier_scheme

        # The actual Peppol ID value being queried
        sig { returns(String) }
        attr_accessor :identifier_value

        # Domain of the SML (Service Metadata Locator) used for the lookup
        sig { returns(String) }
        attr_accessor :sml_domain

        # ISO 8601 timestamp of when the query was executed
        sig { returns(String) }
        attr_accessor :timestamp

        # Version of the API used for the lookup
        sig { returns(String) }
        attr_accessor :version

        # Metadata about the query that was performed
        sig do
          params(
            identifier_scheme: String,
            identifier_value: String,
            sml_domain: String,
            timestamp: String,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Scheme of the identifier, typically 'iso6523-actorid-upis'
          identifier_scheme:,
          # The actual Peppol ID value being queried
          identifier_value:,
          # Domain of the SML (Service Metadata Locator) used for the lookup
          sml_domain:,
          # ISO 8601 timestamp of when the query was executed
          timestamp:,
          # Version of the API used for the lookup
          version:
        )
        end

        sig do
          override.returns(
            {
              identifier_scheme: String,
              identifier_value: String,
              sml_domain: String,
              timestamp: String,
              version: String
            }
          )
        end
        def to_hash
        end
      end

      class ServiceMetadata < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # List of endpoints found for the Peppol participant
        sig do
          returns(
            T::Array[
              EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint
            ]
          )
        end
        attr_accessor :endpoints

        # Time taken to query the service metadata in milliseconds
        sig { returns(Float) }
        attr_accessor :query_time_ms

        # Status of the service metadata lookup: 'success', 'error', or 'pending'
        sig { returns(String) }
        attr_accessor :status

        # Error message if service metadata lookup failed
        sig { returns(T.nilable(String)) }
        attr_accessor :error

        # Service metadata information for the Peppol participant
        sig do
          params(
            endpoints:
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::OrHash
              ],
            query_time_ms: Float,
            status: String,
            error: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # List of endpoints found for the Peppol participant
          endpoints:,
          # Time taken to query the service metadata in milliseconds
          query_time_ms:,
          # Status of the service metadata lookup: 'success', 'error', or 'pending'
          status:,
          # Error message if service metadata lookup failed
          error: nil
        )
        end

        sig do
          override.returns(
            {
              endpoints:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint
                ],
              query_time_ms: Float,
              status: String,
              error: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Endpoint < EInvoiceAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint,
                EInvoiceAPI::Internal::AnyHash
              )
            end

          # List of document types supported by this endpoint
          sig do
            returns(
              T::Array[
                EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType
              ]
            )
          end
          attr_accessor :document_types

          # Status of the endpoint lookup: 'success', 'error', or 'pending'
          sig { returns(String) }
          attr_accessor :status

          # URL of the endpoint
          sig { returns(String) }
          attr_accessor :url

          # Error message if endpoint lookup failed
          sig { returns(T.nilable(String)) }
          attr_accessor :error

          # List of processes supported by this endpoint
          sig do
            returns(
              T.nilable(
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process
                ]
              )
            )
          end
          attr_accessor :processes

          # Information about a Peppol participant's endpoint.
          sig do
            params(
              document_types:
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType::OrHash
                ],
              status: String,
              url: String,
              error: T.nilable(String),
              processes:
                T.nilable(
                  T::Array[
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # List of document types supported by this endpoint
            document_types:,
            # Status of the endpoint lookup: 'success', 'error', or 'pending'
            status:,
            # URL of the endpoint
            url:,
            # Error message if endpoint lookup failed
            error: nil,
            # List of processes supported by this endpoint
            processes: nil
          )
          end

          sig do
            override.returns(
              {
                document_types:
                  T::Array[
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType
                  ],
                status: String,
                url: String,
                error: T.nilable(String),
                processes:
                  T.nilable(
                    T::Array[
                      EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class DocumentType < EInvoiceAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::DocumentType,
                  EInvoiceAPI::Internal::AnyHash
                )
              end

            # Scheme of the document type identifier
            sig { returns(String) }
            attr_accessor :scheme

            # Value of the document type identifier
            sig { returns(String) }
            attr_accessor :value

            # Document type supported by a Peppol participant.
            sig do
              params(scheme: String, value: String).returns(T.attached_class)
            end
            def self.new(
              # Scheme of the document type identifier
              scheme:,
              # Value of the document type identifier
              value:
            )
            end

            sig { override.returns({ scheme: String, value: String }) }
            def to_hash
            end
          end

          class Process < EInvoiceAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process,
                  EInvoiceAPI::Internal::AnyHash
                )
              end

            # List of endpoints supporting this process
            sig do
              returns(
                T::Array[
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint
                ]
              )
            end
            attr_accessor :endpoints

            # Identifier of the process
            sig do
              returns(
                EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID
              )
            end
            attr_reader :process_id

            sig do
              params(
                process_id:
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID::OrHash
              ).void
            end
            attr_writer :process_id

            # Process information in the Peppol network.
            sig do
              params(
                endpoints:
                  T::Array[
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint::OrHash
                  ],
                process_id:
                  EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # List of endpoints supporting this process
              endpoints:,
              # Identifier of the process
              process_id:
            )
            end

            sig do
              override.returns(
                {
                  endpoints:
                    T::Array[
                      EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint
                    ],
                  process_id:
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID
                }
              )
            end
            def to_hash
            end

            class Endpoint < EInvoiceAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::Endpoint,
                    EInvoiceAPI::Internal::AnyHash
                  )
                end

              # URL or address of the endpoint
              sig { returns(String) }
              attr_accessor :address

              # Transport profile used by this endpoint
              sig { returns(String) }
              attr_accessor :transport_profile

              # Certificate information for a Peppol endpoint.
              sig { returns(T.nilable(EInvoiceAPI::Certificate)) }
              attr_reader :certificate

              sig do
                params(
                  certificate: T.nilable(EInvoiceAPI::Certificate::OrHash)
                ).void
              end
              attr_writer :certificate

              # ISO 8601 date when the service was activated
              sig { returns(T.nilable(String)) }
              attr_accessor :service_activation_date

              # Human-readable description of the service
              sig { returns(T.nilable(String)) }
              attr_accessor :service_description

              # ISO 8601 date when the service will expire
              sig { returns(T.nilable(String)) }
              attr_accessor :service_expiration_date

              # URL for technical contact information
              sig { returns(T.nilable(String)) }
              attr_accessor :technical_contact_url

              # URL for technical documentation
              sig { returns(T.nilable(String)) }
              attr_accessor :technical_information_url

              # Endpoint information for a specific Peppol process.
              sig do
                params(
                  address: String,
                  transport_profile: String,
                  certificate: T.nilable(EInvoiceAPI::Certificate::OrHash),
                  service_activation_date: T.nilable(String),
                  service_description: T.nilable(String),
                  service_expiration_date: T.nilable(String),
                  technical_contact_url: T.nilable(String),
                  technical_information_url: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # URL or address of the endpoint
                address:,
                # Transport profile used by this endpoint
                transport_profile:,
                # Certificate information for a Peppol endpoint.
                certificate: nil,
                # ISO 8601 date when the service was activated
                service_activation_date: nil,
                # Human-readable description of the service
                service_description: nil,
                # ISO 8601 date when the service will expire
                service_expiration_date: nil,
                # URL for technical contact information
                technical_contact_url: nil,
                # URL for technical documentation
                technical_information_url: nil
              )
              end

              sig do
                override.returns(
                  {
                    address: String,
                    transport_profile: String,
                    certificate: T.nilable(EInvoiceAPI::Certificate),
                    service_activation_date: T.nilable(String),
                    service_description: T.nilable(String),
                    service_expiration_date: T.nilable(String),
                    technical_contact_url: T.nilable(String),
                    technical_information_url: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end

            class ProcessID < EInvoiceAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    EInvoiceAPI::Models::LookupRetrieveResponse::ServiceMetadata::Endpoint::Process::ProcessID,
                    EInvoiceAPI::Internal::AnyHash
                  )
                end

              # Scheme of the process identifier
              sig { returns(String) }
              attr_accessor :scheme

              # Value of the process identifier
              sig { returns(String) }
              attr_accessor :value

              # Identifier of the process
              sig do
                params(scheme: String, value: String).returns(T.attached_class)
              end
              def self.new(
                # Scheme of the process identifier
                scheme:,
                # Value of the process identifier
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
end
