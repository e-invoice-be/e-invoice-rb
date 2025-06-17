# typed: strong

module EInvoiceAPI
  module Internal
    module Type
      # @api private
      module RequestParameters
        # Options to specify HTTP behaviour for this request.
        sig { returns(EInvoiceAPI::RequestOptions) }
        attr_reader :request_options

        sig do
          params(request_options: EInvoiceAPI::RequestOptions::OrHash).void
        end
        attr_writer :request_options

        # @api private
        module Converter
          # @api private
          sig do
            params(params: T.anything).returns(
              [T.anything, EInvoiceAPI::Internal::AnyHash]
            )
          end
          def dump_request(params)
          end
        end
      end
    end
  end
end
