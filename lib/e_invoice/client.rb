# frozen_string_literal: true

module EInvoice
  class Client < EInvoice::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [EInvoice::Resources::Documents]
    attr_reader :documents

    # @return [EInvoice::Resources::Inbox]
    attr_reader :inbox

    # @return [EInvoice::Resources::Outbox]
    attr_reader :outbox

    # @return [EInvoice::Resources::Validate]
    attr_reader :validate

    # @return [EInvoice::Resources::Lookup]
    attr_reader :lookup

    # @return [EInvoice::Resources::Webhooks]
    attr_reader :webhooks

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["E_INVOICE_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["E_INVOICE_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["E_INVOICE_API_KEY"],
      base_url: ENV["E_INVOICE_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.e-invoice.be"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"E_INVOICE_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @documents = EInvoice::Resources::Documents.new(client: self)
      @inbox = EInvoice::Resources::Inbox.new(client: self)
      @outbox = EInvoice::Resources::Outbox.new(client: self)
      @validate = EInvoice::Resources::Validate.new(client: self)
      @lookup = EInvoice::Resources::Lookup.new(client: self)
      @webhooks = EInvoice::Resources::Webhooks.new(client: self)
    end
  end
end
