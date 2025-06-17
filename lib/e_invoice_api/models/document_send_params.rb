# frozen_string_literal: true

module EInvoiceAPI
  module Models
    # @see EInvoiceAPI::Resources::Documents#send_
    class DocumentSendParams < EInvoiceAPI::Internal::Type::BaseModel
      extend EInvoiceAPI::Internal::Type::RequestParameters::Converter
      include EInvoiceAPI::Internal::Type::RequestParameters

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
      #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
