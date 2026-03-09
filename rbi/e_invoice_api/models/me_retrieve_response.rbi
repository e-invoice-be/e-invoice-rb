# typed: strong

module EInvoiceAPI
  module Models
    class MeRetrieveResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::MeRetrieveResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Credit balance of the tenant
      sig { returns(Integer) }
      attr_accessor :credit_balance

      sig { returns(String) }
      attr_accessor :name

      # Plan of the tenant
      sig do
        returns(EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol)
      end
      attr_accessor :plan

      # BCC recipient email to deliver documents
      sig { returns(T.nilable(String)) }
      attr_accessor :bcc_recipient_email

      # Address of the company. Must be in the form of `Street Name Street Number`
      sig { returns(T.nilable(String)) }
      attr_accessor :company_address

      # City of the company
      sig { returns(T.nilable(String)) }
      attr_accessor :company_city

      # Country of the company
      sig { returns(T.nilable(String)) }
      attr_accessor :company_country

      # Email of the company
      sig { returns(T.nilable(String)) }
      attr_accessor :company_email

      # Name of the company. Must include the company type. For example: `BV`, `NV`,
      # `CVBA`, `VOF`
      sig { returns(T.nilable(String)) }
      attr_accessor :company_name

      # Company number. For Belgium this is the CBE number or their EUID (European
      # Unique Identifier) number
      sig { returns(T.nilable(String)) }
      attr_accessor :company_number

      # Company tax ID. For Belgium this is the VAT number. Must include the country
      # prefix
      sig { returns(T.nilable(String)) }
      attr_accessor :company_tax_id

      # Zip code of the company
      sig { returns(T.nilable(String)) }
      attr_accessor :company_zip

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # IBANs of the tenant
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :ibans

      # Peppol IDs of the tenant
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :peppol_ids

      # Whether the tenant is registered on our SMP
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :smp_registration

      # Date when the tenant was registered on SMP
      sig { returns(T.nilable(Time)) }
      attr_accessor :smp_registration_date

      sig do
        params(
          credit_balance: Integer,
          name: String,
          plan: EInvoiceAPI::Models::MeRetrieveResponse::Plan::OrSymbol,
          bcc_recipient_email: T.nilable(String),
          company_address: T.nilable(String),
          company_city: T.nilable(String),
          company_country: T.nilable(String),
          company_email: T.nilable(String),
          company_name: T.nilable(String),
          company_number: T.nilable(String),
          company_tax_id: T.nilable(String),
          company_zip: T.nilable(String),
          description: T.nilable(String),
          ibans: T.nilable(T::Array[String]),
          peppol_ids: T.nilable(T::Array[String]),
          smp_registration: T.nilable(T::Boolean),
          smp_registration_date: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # Credit balance of the tenant
        credit_balance:,
        name:,
        # Plan of the tenant
        plan:,
        # BCC recipient email to deliver documents
        bcc_recipient_email: nil,
        # Address of the company. Must be in the form of `Street Name Street Number`
        company_address: nil,
        # City of the company
        company_city: nil,
        # Country of the company
        company_country: nil,
        # Email of the company
        company_email: nil,
        # Name of the company. Must include the company type. For example: `BV`, `NV`,
        # `CVBA`, `VOF`
        company_name: nil,
        # Company number. For Belgium this is the CBE number or their EUID (European
        # Unique Identifier) number
        company_number: nil,
        # Company tax ID. For Belgium this is the VAT number. Must include the country
        # prefix
        company_tax_id: nil,
        # Zip code of the company
        company_zip: nil,
        description: nil,
        # IBANs of the tenant
        ibans: nil,
        # Peppol IDs of the tenant
        peppol_ids: nil,
        # Whether the tenant is registered on our SMP
        smp_registration: nil,
        # Date when the tenant was registered on SMP
        smp_registration_date: nil
      )
      end

      sig do
        override.returns(
          {
            credit_balance: Integer,
            name: String,
            plan: EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol,
            bcc_recipient_email: T.nilable(String),
            company_address: T.nilable(String),
            company_city: T.nilable(String),
            company_country: T.nilable(String),
            company_email: T.nilable(String),
            company_name: T.nilable(String),
            company_number: T.nilable(String),
            company_tax_id: T.nilable(String),
            company_zip: T.nilable(String),
            description: T.nilable(String),
            ibans: T.nilable(T::Array[String]),
            peppol_ids: T.nilable(T::Array[String]),
            smp_registration: T.nilable(T::Boolean),
            smp_registration_date: T.nilable(Time)
          }
        )
      end
      def to_hash
      end

      # Plan of the tenant
      module Plan
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, EInvoiceAPI::Models::MeRetrieveResponse::Plan)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STARTER =
          T.let(
            :starter,
            EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol
          )
        PRO =
          T.let(
            :pro,
            EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol
          )
        ENTERPRISE =
          T.let(
            :enterprise,
            EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              EInvoiceAPI::Models::MeRetrieveResponse::Plan::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
