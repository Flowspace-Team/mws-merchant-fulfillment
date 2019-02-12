# frozen_string_literal: true

require 'mws/merchant_fulfillment/document'

module MWS
  module MerchantFulfillment
    class Collection < Document
      include Enumerable

      def each
        raise NotImplementedError
      end

      def empty?
        count.zero?
      end

      def inspect
        "#<#{self.class} #{if count > 3
                             "[#{take(3).map(&:inspect).join(', ')}...]"
                           else
                             "[#{map(&:inspect).join(', ')}]"
                           end}>"
      end

      alias to_s inspect
    end
  end
end
