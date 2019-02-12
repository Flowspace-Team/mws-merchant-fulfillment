# frozen_string_literal: true

require 'mws/merchant_fulfillment/collection'
require 'mws/merchant_fulfillment/shipping_service'

module MWS
  module MerchantFulfillment
    class ShippingServices < Collection
      def each
        xpath('ShippingServiceList/ShippingService').each { |node|
          yield ShippingService.new(node)
        }
      end
    end
  end
end
