# frozen_string_literal: true

require_relative "../../test_helper"

class EInvoiceAPI::Test::Resources::Documents::UblTest < EInvoiceAPI::Test::ResourceTest
  def test_get
    skip("Prism tests are disabled")

    response = @e_invoice.documents.ubl.get("document_id")

    assert_pattern do
      response => EInvoiceAPI::Models::Documents::UblGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        file_name: String,
        file_hash: String | nil,
        file_size: Integer | nil,
        receiver_peppol_id: String | nil,
        receiver_peppol_scheme: String | nil,
        sender_peppol_id: String | nil,
        sender_peppol_scheme: String | nil,
        signed_url: String | nil,
        validated_at: Time | nil
      }
    end
  end
end
