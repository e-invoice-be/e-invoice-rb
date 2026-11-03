# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Conversion
      # @return [EInvoiceAPI::Resources::Conversion::Pdf]
      attr_reader :pdf

      # @api private
      #
      # @param client [EInvoiceAPI::Client]
      def initialize(client:)
        @client = client
        @pdf = EInvoiceAPI::Resources::Conversion::Pdf.new(client: client)
      end
    end
  end
end
