# typed: strong

module EInvoice
  module Models
    class DocumentAttachmentCreate < EInvoice::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoice::DocumentAttachmentCreate, EInvoice::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :file_name

      sig { returns(T.nilable(String)) }
      attr_accessor :file_data

      sig { returns(T.nilable(Integer)) }
      attr_reader :file_size

      sig { params(file_size: Integer).void }
      attr_writer :file_size

      sig { returns(T.nilable(String)) }
      attr_reader :file_type

      sig { params(file_type: String).void }
      attr_writer :file_type

      sig do
        params(
          file_name: String,
          file_data: T.nilable(String),
          file_size: Integer,
          file_type: String
        ).returns(T.attached_class)
      end
      def self.new(file_name:, file_data: nil, file_size: nil, file_type: nil)
      end

      sig do
        override.returns(
          {
            file_name: String,
            file_data: T.nilable(String),
            file_size: Integer,
            file_type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
