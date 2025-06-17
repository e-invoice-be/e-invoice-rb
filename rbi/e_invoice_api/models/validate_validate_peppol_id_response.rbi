# typed: strong

module EInvoiceAPI
  module Models
    class ValidateValidatePeppolIDResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::ValidateValidatePeppolIDResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Business card information for the Peppol ID
      sig do
        returns(
          T.nilable(
            EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard
          )
        )
      end
      attr_reader :business_card

      sig do
        params(
          business_card:
            T.nilable(
              EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard::OrHash
            )
        ).void
      end
      attr_writer :business_card

      # Whether a business card is set at the SMP
      sig { returns(T::Boolean) }
      attr_accessor :business_card_valid

      # Whether the DNS resolves to a valid SMP
      sig { returns(T::Boolean) }
      attr_accessor :dns_valid

      # Whether the Peppol ID is valid and registered in the Peppol network
      sig { returns(T::Boolean) }
      attr_accessor :is_valid

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :supported_document_types

      sig { params(supported_document_types: T::Array[String]).void }
      attr_writer :supported_document_types

      # Response for a Peppol ID validation request.
      #
      # This model represents the validation result of a Peppol ID in the Peppol
      # network, including whether the ID is valid and what document types it supports.
      sig do
        params(
          business_card:
            T.nilable(
              EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard::OrHash
            ),
          business_card_valid: T::Boolean,
          dns_valid: T::Boolean,
          is_valid: T::Boolean,
          supported_document_types: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Business card information for the Peppol ID
        business_card:,
        # Whether a business card is set at the SMP
        business_card_valid:,
        # Whether the DNS resolves to a valid SMP
        dns_valid:,
        # Whether the Peppol ID is valid and registered in the Peppol network
        is_valid:,
        supported_document_types: nil
      )
      end

      sig do
        override.returns(
          {
            business_card:
              T.nilable(
                EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard
              ),
            business_card_valid: T::Boolean,
            dns_valid: T::Boolean,
            is_valid: T::Boolean,
            supported_document_types: T::Array[String]
          }
        )
      end
      def to_hash
      end

      class BusinessCard < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Models::ValidateValidatePeppolIDResponse::BusinessCard,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :country_code

        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig { returns(T.nilable(Date)) }
        attr_accessor :registration_date

        # Business card information for the Peppol ID
        sig do
          params(
            country_code: T.nilable(String),
            name: T.nilable(String),
            registration_date: T.nilable(Date)
          ).returns(T.attached_class)
        end
        def self.new(country_code: nil, name: nil, registration_date: nil)
        end

        sig do
          override.returns(
            {
              country_code: T.nilable(String),
              name: T.nilable(String),
              registration_date: T.nilable(Date)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
