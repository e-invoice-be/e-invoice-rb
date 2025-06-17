# typed: strong

module EInvoiceAPI
  module Models
    class UblDocumentValidation < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            EInvoiceAPI::UblDocumentValidation,
            EInvoiceAPI::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(String)) }
      attr_accessor :file_name

      sig { returns(T::Boolean) }
      attr_accessor :is_valid

      sig { returns(T::Array[EInvoiceAPI::UblDocumentValidation::Issue]) }
      attr_accessor :issues

      sig { returns(T.nilable(String)) }
      attr_accessor :ubl_document

      sig do
        params(
          id: String,
          file_name: T.nilable(String),
          is_valid: T::Boolean,
          issues: T::Array[EInvoiceAPI::UblDocumentValidation::Issue::OrHash],
          ubl_document: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(id:, file_name:, is_valid:, issues:, ubl_document: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            file_name: T.nilable(String),
            is_valid: T::Boolean,
            issues: T::Array[EInvoiceAPI::UblDocumentValidation::Issue],
            ubl_document: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Issue < EInvoiceAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              EInvoiceAPI::UblDocumentValidation::Issue,
              EInvoiceAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message

        sig { returns(String) }
        attr_accessor :schematron

        sig do
          returns(EInvoiceAPI::UblDocumentValidation::Issue::Type::TaggedSymbol)
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :flag

        sig { returns(T.nilable(String)) }
        attr_accessor :location

        sig { returns(T.nilable(String)) }
        attr_accessor :rule_id

        sig { returns(T.nilable(String)) }
        attr_accessor :test_

        sig do
          params(
            message: String,
            schematron: String,
            type: EInvoiceAPI::UblDocumentValidation::Issue::Type::OrSymbol,
            flag: T.nilable(String),
            location: T.nilable(String),
            rule_id: T.nilable(String),
            test_: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          message:,
          schematron:,
          type:,
          flag: nil,
          location: nil,
          rule_id: nil,
          test_: nil
        )
        end

        sig do
          override.returns(
            {
              message: String,
              schematron: String,
              type:
                EInvoiceAPI::UblDocumentValidation::Issue::Type::TaggedSymbol,
              flag: T.nilable(String),
              location: T.nilable(String),
              rule_id: T.nilable(String),
              test_: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Type
          extend EInvoiceAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, EInvoiceAPI::UblDocumentValidation::Issue::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ERROR =
            T.let(
              :error,
              EInvoiceAPI::UblDocumentValidation::Issue::Type::TaggedSymbol
            )
          WARNING =
            T.let(
              :warning,
              EInvoiceAPI::UblDocumentValidation::Issue::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                EInvoiceAPI::UblDocumentValidation::Issue::Type::TaggedSymbol
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
