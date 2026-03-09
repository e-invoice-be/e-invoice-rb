# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#create
    class DocumentCreateParams < EInvoiceAPI::Models::DocumentCreate
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute construct_pdf
      #   If true, generate a constructed PDF from the document and include it both as
      #   document attachment and embedded in the UBL.
      #
      #   @return [Boolean, nil]
      optional :construct_pdf, EInvoiceAPI::Internal::Type::Boolean

      # @!method initialize(construct_pdf: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::DocumentCreateParams} for more details.
      #
      #   @param construct_pdf [Boolean] If true, generate a constructed PDF from the document and include it both as doc
      #
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
