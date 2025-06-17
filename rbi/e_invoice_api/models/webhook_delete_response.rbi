# typed: strong

module EInvoiceAPI
  module Models
    class WebhookDeleteResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::WebhookDeleteResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :is_deleted

      # Model for webhook deletion.
      sig { params(is_deleted: T::Boolean).returns(T.attached_class) }
      def self.new(is_deleted:)
      end

      sig { override.returns({ is_deleted: T::Boolean }) }
      def to_hash
      end
    end
  end
end
