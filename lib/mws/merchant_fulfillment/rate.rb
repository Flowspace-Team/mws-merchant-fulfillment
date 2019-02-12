# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class Rate < Entity
      attribute(:currency_code) do
        text_at_xpath('CurrencyCode')
      end

      attribute(:amount) do
        float_at_xpath('Amount')
      end
    end
  end
end
