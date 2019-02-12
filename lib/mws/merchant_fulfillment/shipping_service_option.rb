# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class ShippingServiceOption < Entity
      attribute(:carrier_will_pickup) do
        boolean_at_path('CarrierWillPickUp')
      end

      attribute(:delivery_experience) do
        text_at_xpath('DeliveryExperience')
      end
    end
  end
end
