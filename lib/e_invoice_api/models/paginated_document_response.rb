# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class PaginatedDocumentResponse < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<EInvoiceAPI::Models::DocumentResponse>]
      required :items, -> { EInvoiceAPI::Internal::Type::ArrayOf[EInvoiceAPI::DocumentResponse] }

      # @!attribute page
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute pages
      #
      #   @return [Integer]
      required :pages, Integer

      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!method initialize(items:, page:, page_size:, pages:, total:)
      #   @param items [Array<EInvoiceAPI::Models::DocumentResponse>]
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param pages [Integer]
      #   @param total [Integer]
    end
  end
end
