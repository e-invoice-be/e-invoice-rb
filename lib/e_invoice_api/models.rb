# frozen_string_literal: true

module EInvoiceAPI
  [EInvoiceAPI::Internal::Type::BaseModel, *EInvoiceAPI::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, EInvoiceAPI::Internal::AnyHash) } }
  end

  EInvoiceAPI::Internal::Util.walk_namespaces(EInvoiceAPI::Models).each do |mod|
    case mod
    in EInvoiceAPI::Internal::Type::Enum | EInvoiceAPI::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  EInvoiceAPI::Internal::Util.walk_namespaces(EInvoiceAPI::Models)
                             .lazy
                             .grep(EInvoiceAPI::Internal::Type::Union)
                             .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Certificate = EInvoiceAPI::Models::Certificate

  CurrencyCode = EInvoiceAPI::Models::CurrencyCode

  DocumentAttachmentCreate = EInvoiceAPI::Models::DocumentAttachmentCreate

  DocumentCreate = EInvoiceAPI::Models::DocumentCreate

  DocumentCreateParams = EInvoiceAPI::Models::DocumentCreateParams

  DocumentDeleteParams = EInvoiceAPI::Models::DocumentDeleteParams

  DocumentDirection = EInvoiceAPI::Models::DocumentDirection

  DocumentResponse = EInvoiceAPI::Models::DocumentResponse

  DocumentRetrieveParams = EInvoiceAPI::Models::DocumentRetrieveParams

  Documents = EInvoiceAPI::Models::Documents

  DocumentSendParams = EInvoiceAPI::Models::DocumentSendParams

  DocumentState = EInvoiceAPI::Models::DocumentState

  DocumentType = EInvoiceAPI::Models::DocumentType

  InboxListCreditNotesParams = EInvoiceAPI::Models::InboxListCreditNotesParams

  InboxListInvoicesParams = EInvoiceAPI::Models::InboxListInvoicesParams

  InboxListParams = EInvoiceAPI::Models::InboxListParams

  LookupRetrieveParams = EInvoiceAPI::Models::LookupRetrieveParams

  OutboxListDraftDocumentsParams = EInvoiceAPI::Models::OutboxListDraftDocumentsParams

  OutboxListReceivedDocumentsParams = EInvoiceAPI::Models::OutboxListReceivedDocumentsParams

  PaginatedDocumentResponse = EInvoiceAPI::Models::PaginatedDocumentResponse

  PaymentDetailCreate = EInvoiceAPI::Models::PaymentDetailCreate

  UblDocumentValidation = EInvoiceAPI::Models::UblDocumentValidation

  UnitOfMeasureCode = EInvoiceAPI::Models::UnitOfMeasureCode

  ValidateValidateJsonParams = EInvoiceAPI::Models::ValidateValidateJsonParams

  ValidateValidatePeppolIDParams = EInvoiceAPI::Models::ValidateValidatePeppolIDParams

  ValidateValidateUblParams = EInvoiceAPI::Models::ValidateValidateUblParams

  WebhookCreateParams = EInvoiceAPI::Models::WebhookCreateParams

  WebhookDeleteParams = EInvoiceAPI::Models::WebhookDeleteParams

  WebhookListParams = EInvoiceAPI::Models::WebhookListParams

  WebhookResponse = EInvoiceAPI::Models::WebhookResponse

  WebhookRetrieveParams = EInvoiceAPI::Models::WebhookRetrieveParams

  WebhookUpdateParams = EInvoiceAPI::Models::WebhookUpdateParams
end
