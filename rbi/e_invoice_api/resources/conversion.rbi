# typed: strong

module EInvoiceAPI
  module Resources
    class Conversion
      sig { returns(EInvoiceAPI::Resources::Conversion::Pdf) }
      attr_reader :pdf

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
