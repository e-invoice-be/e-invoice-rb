# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#create_from_pdf
    class DocumentCreateFromPdfParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

      # @!attribute file
      #
      #   @return [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
      required :file, EInvoiceAPI::Internal::Type::FileInput

      # @!attribute customer_tax_id
      #
      #   @return [String, nil]
      optional :customer_tax_id, String, nil?: true

      # @!attribute vendor_tax_id
      #
      #   @return [String, nil]
      optional :vendor_tax_id, String, nil?: true

      # @!method initialize(file:, customer_tax_id: nil, vendor_tax_id: nil, request_options: {})
      #   @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
      #   @param customer_tax_id [String, nil]
      #   @param vendor_tax_id [String, nil]
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
