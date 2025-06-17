# frozen_string_literal: true

require_relative "../../test_helper"

class EInvoice::Test::Resources::Documents::UblTest < EInvoice::Test::ResourceTest
  def test_get
    skip("skipped: tests are disabled for the time being")

    response = @e_invoice.documents.ubl.get("document_id")

    assert_pattern do
      response => EInvoice::Models::Documents::UblGetResponse
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
