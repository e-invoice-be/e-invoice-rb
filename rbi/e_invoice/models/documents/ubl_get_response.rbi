# typed: strong

module EInvoice
  module Models
    module Documents
      class UblGetResponse < EInvoice::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoice::Models::Documents::UblGetResponse,
              EInvoice::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :file_name

        sig { returns(T.nilable(String)) }
        attr_accessor :file_hash

        sig { returns(T.nilable(Integer)) }
        attr_reader :file_size

        sig { params(file_size: Integer).void }
        attr_writer :file_size

        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_peppol_id

        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_peppol_scheme

        sig { returns(T.nilable(String)) }
        attr_accessor :sender_peppol_id

        sig { returns(T.nilable(String)) }
        attr_accessor :sender_peppol_scheme

        sig { returns(T.nilable(String)) }
        attr_accessor :signed_url

        sig { returns(T.nilable(Time)) }
        attr_accessor :validated_at

        sig do
          params(
            id: String,
            file_name: String,
            file_hash: T.nilable(String),
            file_size: Integer,
            receiver_peppol_id: T.nilable(String),
            receiver_peppol_scheme: T.nilable(String),
            sender_peppol_id: T.nilable(String),
            sender_peppol_scheme: T.nilable(String),
            signed_url: T.nilable(String),
            validated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          file_name:,
          file_hash: nil,
          file_size: nil,
          receiver_peppol_id: nil,
          receiver_peppol_scheme: nil,
          sender_peppol_id: nil,
          sender_peppol_scheme: nil,
          signed_url: nil,
          validated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              file_name: String,
              file_hash: T.nilable(String),
              file_size: Integer,
              receiver_peppol_id: T.nilable(String),
              receiver_peppol_scheme: T.nilable(String),
              sender_peppol_id: T.nilable(String),
              sender_peppol_scheme: T.nilable(String),
              signed_url: T.nilable(String),
              validated_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
