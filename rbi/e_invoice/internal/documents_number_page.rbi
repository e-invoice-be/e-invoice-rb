# typed: strong

module EInvoice
  module Internal
    class DocumentsNumberPage
      include EInvoice::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(Integer) }
      attr_accessor :total

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
