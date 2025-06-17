# frozen_string_literal: true

module EInvoice
  [EInvoice::Internal::Type::BaseModel, *EInvoice::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, EInvoice::Internal::AnyHash) } }
  end

  EInvoice::Internal::Util.walk_namespaces(EInvoice::Models).each do |mod|
    case mod
    in EInvoice::Internal::Type::Enum | EInvoice::Internal::Type::Union
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

  EInvoice::Internal::Util.walk_namespaces(EInvoice::Models)
                          .lazy
                          .grep(EInvoice::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Certificate = EInvoice::Models::Certificate

  CurrencyCode = EInvoice::Models::CurrencyCode

  DocumentAttachmentCreate = EInvoice::Models::DocumentAttachmentCreate

  DocumentCreate = EInvoice::Models::DocumentCreate

  DocumentCreateParams = EInvoice::Models::DocumentCreateParams

  DocumentDeleteParams = EInvoice::Models::DocumentDeleteParams

  DocumentDirection = EInvoice::Models::DocumentDirection

  DocumentResponse = EInvoice::Models::DocumentResponse

  DocumentRetrieveParams = EInvoice::Models::DocumentRetrieveParams

  Documents = EInvoice::Models::Documents

  DocumentSendParams = EInvoice::Models::DocumentSendParams

  DocumentState = EInvoice::Models::DocumentState

  DocumentType = EInvoice::Models::DocumentType

  InboxListCreditNotesParams = EInvoice::Models::InboxListCreditNotesParams

  InboxListInvoicesParams = EInvoice::Models::InboxListInvoicesParams

  InboxListParams = EInvoice::Models::InboxListParams

  LookupRetrieveParams = EInvoice::Models::LookupRetrieveParams

  OutboxListDraftDocumentsParams = EInvoice::Models::OutboxListDraftDocumentsParams

  OutboxListReceivedDocumentsParams = EInvoice::Models::OutboxListReceivedDocumentsParams

  PaginatedDocumentResponse = EInvoice::Models::PaginatedDocumentResponse

  PaymentDetailCreate = EInvoice::Models::PaymentDetailCreate

  UblDocumentValidation = EInvoice::Models::UblDocumentValidation

  UnitOfMeasureCode = EInvoice::Models::UnitOfMeasureCode

  ValidateValidateJsonParams = EInvoice::Models::ValidateValidateJsonParams

  ValidateValidatePeppolIDParams = EInvoice::Models::ValidateValidatePeppolIDParams

  ValidateValidateUblParams = EInvoice::Models::ValidateValidateUblParams

  WebhookCreateParams = EInvoice::Models::WebhookCreateParams

  WebhookDeleteParams = EInvoice::Models::WebhookDeleteParams

  WebhookListParams = EInvoice::Models::WebhookListParams

  WebhookResponse = EInvoice::Models::WebhookResponse

  WebhookRetrieveParams = EInvoice::Models::WebhookRetrieveParams

  WebhookUpdateParams = EInvoice::Models::WebhookUpdateParams
end
