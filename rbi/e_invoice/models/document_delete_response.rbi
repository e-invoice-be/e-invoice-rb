# typed: strong

module EInvoice
  module Models
    class DocumentDeleteResponse < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoice::Models::DocumentDeleteResponse,
            EInvoice::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :is_deleted

      sig { params(is_deleted: T::Boolean).returns(T.attached_class) }
      def self.new(is_deleted:)
      end

      sig { override.returns({ is_deleted: T::Boolean }) }
      def to_hash
      end
    end
  end
end
