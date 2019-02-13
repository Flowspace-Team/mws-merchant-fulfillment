# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class ServiceStatusMessage < Entity
      attribute(:locale) do
        text_at_xpath('Locale')
      end

      attribute(:text) do
        text_at_xpath('Text')
      end
    end
  end
end
