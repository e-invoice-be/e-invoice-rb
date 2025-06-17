# frozen_string_literal: true

module EInvoice
  module Models
    class Certificate < EInvoice::Internal::Type::BaseModel
      # @!attribute status
      #   Status of the certificate validation: 'success', 'error', or 'pending'
      #
      #   @return [String]
      required :status, String

      # @!attribute details
      #   Details about the certificate including subject, issuer, validity dates, etc.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :details, EInvoice::Internal::Type::HashOf[EInvoice::Internal::Type::Unknown], nil?: true

      # @!attribute error
      #   Error message if certificate validation failed
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!method initialize(status:, details: nil, error: nil)
      #   Certificate information for a Peppol endpoint.
      #
      #   @param status [String] Status of the certificate validation: 'success', 'error', or 'pending'
      #
      #   @param details [Hash{Symbol=>Object}, nil] Details about the certificate including subject, issuer, validity dates, etc.
      #
      #   @param error [String, nil] Error message if certificate validation failed
    end
  end
end
