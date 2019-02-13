# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class PackageDimensions < Entity
      attribute(:width) do
        float_at_xpath('Width')
      end

      attribute(:length) do
        float_at_xpath('Length')
      end

      attribute(:height) do
        float_at_xpath('Height')
      end

      attribute(:unit) do
        text_at_xpath('Unit')
      end
    end
  end
end
