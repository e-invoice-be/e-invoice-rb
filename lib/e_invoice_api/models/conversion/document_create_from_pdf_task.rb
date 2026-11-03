# frozen_string_literal: true

module EInvoiceAPI
  module Models
    module Conversion
      # @see EInvoiceAPI::Resources::Conversion::Pdf#create
      class DocumentCreateFromPdfTask < EInvoiceAPI::Internal::Type::BaseModel
        # @!attribute task_id
        #   The ID of the task that will process the PDF
        #
        #   @return [String]
        required :task_id, String

        # @!attribute status
        #   The status of the task
        #
        #   @return [Symbol, EInvoiceAPI::Models::Conversion::DocumentCreateFromPdfTask::Status, nil]
        optional :status, enum: -> { EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status }

        # @!method initialize(task_id:, status: nil)
        #   @param task_id [String] The ID of the task that will process the PDF
        #
        #   @param status [Symbol, EInvoiceAPI::Models::Conversion::DocumentCreateFromPdfTask::Status] The status of the task

        # The status of the task
        #
        # @see EInvoiceAPI::Models::Conversion::DocumentCreateFromPdfTask#status
        module Status
          extend EInvoiceAPI::Internal::Type::Enum

          PENDING = :pending
          COMPLETED = :completed
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    DocumentCreateFromPdfTask = Conversion::DocumentCreateFromPdfTask
  end
end
