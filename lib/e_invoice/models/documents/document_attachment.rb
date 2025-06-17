# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @see EInvoice::Resources::Documents::Attachments#retrieve
      class DocumentAttachment < EInvoice::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute file_name
        #
        #   @return [String]
        required :file_name, String

        # @!attribute file_size
        #
        #   @return [Integer, nil]
        optional :file_size, Integer

        # @!attribute file_type
        #
        #   @return [String, nil]
        optional :file_type, String

        # @!attribute file_url
        #
        #   @return [String, nil]
        optional :file_url, String, nil?: true

        # @!method initialize(id:, file_name:, file_size: nil, file_type: nil, file_url: nil)
        #   @param id [String]
        #   @param file_name [String]
        #   @param file_size [Integer]
        #   @param file_type [String]
        #   @param file_url [String, nil]
      end
    end

    DocumentAttachment = Documents::DocumentAttachment
  end
end
