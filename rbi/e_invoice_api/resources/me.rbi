# typed: strong

module EInvoiceAPI
  module Resources
    class Me
      # Retrieve information about your account.
      sig do
        params(request_options: EInvoiceAPI::RequestOptions::OrHash).returns(
          EInvoiceAPI::Models::MeRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: EInvoiceAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
