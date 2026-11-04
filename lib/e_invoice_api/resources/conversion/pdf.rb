# frozen_string_literal: true

module EInvoiceAPI
  module Resources
    class Conversion
      class Pdf
        # Convert a PDF to a document
        #
        # @overload create(file:, request_options: {})
        #
        #   @param file [Pathname, StringIO, IO, String, EInvoiceAPI::FilePart]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Conversion::DocumentCreateFromPdfTask]
        #
        # @see EInvoiceAPI::Models::Conversion::PdfCreateParams
        def create(params)
          parsed, options = EInvoiceAPI::Conversion::PdfCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/conversion/pdf",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: EInvoiceAPI::Conversion::DocumentCreateFromPdfTask,
            options: options
          )
        end

        # Get the status of a PDF conversion task
        #
        # @overload retrieve(task_id, request_options: {})
        #
        #   @param task_id [String]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::Conversion::DocumentCreateFromPdfTask]
        #
        # @see EInvoiceAPI::Models::Conversion::PdfRetrieveParams
        def retrieve(task_id, params = {})
          @client.request(
            method: :get,
            path: ["api/conversion/pdf/%1$s", task_id],
            model: EInvoiceAPI::Conversion::DocumentCreateFromPdfTask,
            options: params[:request_options]
          )
        end

        # Get the result of a PDF conversion task
        #
        # @overload result(task_id, request_options: {})
        #
        #   @param task_id [String]
        #   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [EInvoiceAPI::Models::DocumentCreateFromPdfResponse]
        #
        # @see EInvoiceAPI::Models::Conversion::PdfResultParams
        def result(task_id, params = {})
          @client.request(
            method: :get,
            path: ["api/conversion/pdf/%1$s/result", task_id],
            model: EInvoiceAPI::Models::DocumentCreateFromPdfResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [EInvoiceAPI::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
