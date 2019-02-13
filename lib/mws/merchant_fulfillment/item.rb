# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class Item < Entity
      attribute(:quantity) do
        integer_at_xpath('Quantity')
      end

      attribute(:order_item_id) do
        text_at_xpath('OrderItemId')
      end
    end
  end
end
