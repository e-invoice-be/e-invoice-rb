# frozen_string_literal: true

module EInvoice
  module Models
    module Documents
      # @see EInvoice::Resources::Documents::Ubl#get
      class UblGetResponse < EInvoice::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute file_name
        #
        #   @return [String]
        required :file_name, String

        # @!attribute file_hash
        #
        #   @return [String, nil]
        optional :file_hash, String, nil?: true

        # @!attribute file_size
        #
        #   @return [Integer, nil]
        optional :file_size, Integer

        # @!attribute receiver_peppol_id
        #
        #   @return [String, nil]
        optional :receiver_peppol_id, String, nil?: true

        # @!attribute receiver_peppol_scheme
        #
        #   @return [String, nil]
        optional :receiver_peppol_scheme, String, nil?: true

        # @!attribute sender_peppol_id
        #
        #   @return [String, nil]
        optional :sender_peppol_id, String, nil?: true

        # @!attribute sender_peppol_scheme
        #
        #   @return [String, nil]
        optional :sender_peppol_scheme, String, nil?: true

        # @!attribute signed_url
        #
        #   @return [String, nil]
        optional :signed_url, String, nil?: true

        # @!attribute validated_at
        #
        #   @return [Time, nil]
        optional :validated_at, Time, nil?: true

        # @!method initialize(id:, file_name:, file_hash: nil, file_size: nil, receiver_peppol_id: nil, receiver_peppol_scheme: nil, sender_peppol_id: nil, sender_peppol_scheme: nil, signed_url: nil, validated_at: nil)
        #   @param id [String]
        #   @param file_name [String]
        #   @param file_hash [String, nil]
        #   @param file_size [Integer]
        #   @param receiver_peppol_id [String, nil]
        #   @param receiver_peppol_scheme [String, nil]
        #   @param sender_peppol_id [String, nil]
        #   @param sender_peppol_scheme [String, nil]
        #   @param signed_url [String, nil]
        #   @param validated_at [Time, nil]
      end
    end
  end
end
