# typed: strong

module EInvoiceAPI
  module Internal
    class DocumentsNumberPage
      include EInvoiceAPI::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(Integer) }
      attr_accessor :total

      sig { returns(Integer) }
      attr_accessor :pages

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
