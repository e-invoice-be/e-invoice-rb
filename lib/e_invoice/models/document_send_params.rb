# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Documents#send_
    class DocumentSendParams < EInvoice::Internal::Type::BaseModel
      extend EInvoice::Internal::Type::RequestParameters::Converter
      include EInvoice::Internal::Type::RequestParameters

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

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

      # @!method initialize(email: nil, receiver_peppol_id: nil, receiver_peppol_scheme: nil, sender_peppol_id: nil, sender_peppol_scheme: nil, request_options: {})
      #   @param email [String, nil]
      #   @param receiver_peppol_id [String, nil]
      #   @param receiver_peppol_scheme [String, nil]
      #   @param sender_peppol_id [String, nil]
      #   @param sender_peppol_scheme [String, nil]
      #   @param request_options [EInvoice::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
