# typed: strong

module EInvoice
  module Models
    class InboxListCreditNotesParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            EInvoice::InboxListCreditNotesParams,
            EInvoice::Internal::AnyHash
          )
        end

      # Page number
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: EInvoice::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number
        page: nil,
        # Number of items per page
        page_size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            request_options: EInvoice::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
