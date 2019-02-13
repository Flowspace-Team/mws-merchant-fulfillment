# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class Weight < Entity
      attribute(:value) do
        float_at_xpath('Value')
      end

      attribute(:unit) do
        text_at_xpath('Unit')
      end
    end
  end
end
