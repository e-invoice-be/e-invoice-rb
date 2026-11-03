# typed: strong

module EInvoiceAPI
  module Models
    class WebhookHistoryResponse < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::Models::WebhookHistoryResponse,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
      attr_accessor :history

      sig do
        params(history: T::Array[T::Hash[Symbol, T.anything]]).returns(
          T.attached_class
        )
      end
      def self.new(history:)
      end

      sig do
        override.returns({ history: T::Array[T::Hash[Symbol, T.anything]] })
      end
      def to_hash
      end
    end
  end
end
