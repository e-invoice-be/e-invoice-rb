# typed: strong

module EInvoice
  module Models
    class PaginatedDocumentResponse < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoice::PaginatedDocumentResponse,
            EInvoice::Internal::AnyHash
          )
        end

      sig { returns(T::Array[EInvoice::DocumentResponse]) }
      attr_accessor :items

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(Integer) }
      attr_accessor :pages

      sig { returns(Integer) }
      attr_accessor :total

      sig do
        params(
          items: T::Array[EInvoice::DocumentResponse::OrHash],
          page: Integer,
          page_size: Integer,
          pages: Integer,
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(items:, page:, page_size:, pages:, total:)
      end

      sig do
        override.returns(
          {
            items: T::Array[EInvoice::DocumentResponse],
            page: Integer,
            page_size: Integer,
            pages: Integer,
            total: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
