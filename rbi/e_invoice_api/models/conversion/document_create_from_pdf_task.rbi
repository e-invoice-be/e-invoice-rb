# typed: strong

module EInvoiceAPI
  module Models
    DocumentCreateFromPdfTask = Conversion::DocumentCreateFromPdfTask

    module Conversion
      class DocumentCreateFromPdfTask < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        # The ID of the task that will process the PDF
        sig { returns(String) }
        attr_accessor :task_id

        # The status of the task
        sig do
          returns(
            T.nilable(
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            task_id: String,
            status:
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the task that will process the PDF
          task_id:,
          # The status of the task
          status: nil
        )
        end

        sig do
          override.returns(
            {
              task_id: String,
              status:
                EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The status of the task
        module Status
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::Conversion::DocumentCreateFromPdfTask::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
