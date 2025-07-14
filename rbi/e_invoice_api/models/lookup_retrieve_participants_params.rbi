# typed: strong

module EInvoiceAPI
  module Models
    class LookupRetrieveParticipantsParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::LookupRetrieveParticipantsParams,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      # Query to lookup
      sig { returns(String) }
      attr_accessor :query

      # Country code of the company to lookup. If not provided, the search will be
      # global.
      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      sig do
        params(
          query: String,
          country_code: T.nilable(String),
          request_options: EInvoiceAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Query to lookup
        query:,
        # Country code of the company to lookup. If not provided, the search will be
        # global.
        country_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            country_code: T.nilable(String),
            request_options: EInvoiceAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
