# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class ShippingServiceOptions < Entity
      attribute(:carrier_will_pickup) do
        boolean_at_path('CarrierWillPickUp')
      end

      attribute(:delivery_experience) do
        text_at_xpath('DeliveryExperience')
      end

      attribute(:label_format) do
        text_at_xpath('LabelFormat')
      end

      attribute(:declared_value) do
        money_at_xpath('DeclaredValue')
      end
    end
  end
end
