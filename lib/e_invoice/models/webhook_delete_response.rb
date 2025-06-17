# frozen_string_literal: true

module EInvoice
  module Models
    # @see EInvoice::Resources::Webhooks#delete
    class WebhookDeleteResponse < EInvoice::Internal::Type::BaseModel
      # @!attribute is_deleted
      #
      #   @return [Boolean]
      required :is_deleted, EInvoice::Internal::Type::Boolean

      # @!method initialize(is_deleted:)
      #   Model for webhook deletion.
      #
      #   @param is_deleted [Boolean]
    end
  end
end
