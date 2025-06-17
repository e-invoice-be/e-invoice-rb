# frozen_string_literal: true

module EInvoiceAPI
  module Internal
    # @generic Elem
    #
    # @example
    #   if documents_number_page.has_next?
    #     documents_number_page = documents_number_page.next_page
    #   end
    #
    # @example
    #   documents_number_page.auto_paging_each do |inbox|
    #     puts(inbox)
    #   end
    class DocumentsNumberPage
      include EInvoiceAPI::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :items

      # @return [Integer]
      attr_accessor :page

      # @return [Integer]
      attr_accessor :page_size

      # @return [Integer]
      attr_accessor :total

      # @return [Boolean]
      def next_page?
        !items.to_a.empty? && (page.nil? || total.nil? || page < total)
      end

      # @raise [EInvoiceAPI::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = EInvoiceAPI::Internal::Util.deep_merge(@req, {query: {page: (page || 1).to_i.succ}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.items&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [EInvoiceAPI::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}, Net::HTTPHeader]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {items: Array => items}
          @items = items.map { EInvoiceAPI::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @page = page_data[:page]
        @page_size = page_data[:page_size]
        @total = page_data[:total]
      end

      # @api private
      #
      # @return [String]
      def inspect
        # rubocop:disable Layout/LineLength
        model = EInvoiceAPI::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} page=#{page.inspect} page_size=#{page_size.inspect} total=#{total.inspect}>"
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
