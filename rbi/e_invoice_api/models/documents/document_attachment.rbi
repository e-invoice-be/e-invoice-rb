# typed: strong

module EInvoiceAPI
  module Models
    DocumentAttachment = Documents::DocumentAttachment

    module Documents
      class DocumentAttachment < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::Documents::DocumentAttachment,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :file_name

        sig { returns(T.nilable(Integer)) }
        attr_reader :file_size

        sig { params(file_size: Integer).void }
        attr_writer :file_size

        sig { returns(T.nilable(String)) }
        attr_reader :file_type

        sig { params(file_type: String).void }
        attr_writer :file_type

        sig { returns(T.nilable(String)) }
        attr_accessor :file_url

        sig do
          params(
            id: String,
            file_name: String,
            file_size: Integer,
            file_type: String,
            file_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          file_name:,
          file_size: nil,
          file_type: nil,
          file_url: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              file_name: String,
              file_size: Integer,
              file_type: String,
              file_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
