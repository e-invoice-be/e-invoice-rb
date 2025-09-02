# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class DocumentAttachmentCreate < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute file_name
      #
      #   @return [String]
      required :file_name, String

      # @!attribute file_data
      #   Base64 encoded file data
      #
      #   @return [String, nil]
      optional :file_data, String, nil?: true

      # @!attribute file_size
      #
      #   @return [Integer, nil]
      optional :file_size, Integer

      # @!attribute file_type
      #
      #   @return [String, nil]
      optional :file_type, String

      # @!method initialize(file_name:, file_data: nil, file_size: nil, file_type: nil)
      #   @param file_name [String]
      #
      #   @param file_data [String, nil] Base64 encoded file data
      #
      #   @param file_size [Integer]
      #
      #   @param file_type [String]
    end
  end
end
