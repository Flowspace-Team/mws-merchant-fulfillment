# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'
require 'mws/merchant_fulfillment/shipping_service_option'
require 'mws/merchant_fulfillment/rate'
require 'mws/merchant_fulfillment/available_format_options_for_label'

module MWS
  module MerchantFulfillment
    class ShippingService < Entity
      attribute(:carrier_name) do
        text_at_xpath('CarrierName')
      end

      attribute(:shipping_service_options) do
        xpath('ShippingServiceOptions').map { |node| ShippingServiceOption.new(node) }
      end

      attribute(:shipping_service_id) do
        text_at_xpath('ShippingServiceId')
      end

      attribute(:rates) do
        xpath('Rate').map { |node| Rate.new(node) }
      end

      attribute(:latest_estimated_delivery_date) do
        time_at_xpath('LatestEstimatedDeliveryDate')
      end

      attribute(:earliest_estimated_delivery_date) do
        time_at_xpath('EarliestEstimatedDeliveryDate')
      end

      attribute(:shipping_service_offer_id) do
        text_at_xpath('ShippingServiceOfferId')
      end

      attribute(:available_label_formats) do
        xpath('AvailableLabelFormats/LabelFormat').map { |node|
          node&.text&.strip
        }
      end

      attribute(:ship_date) do
        time_at_xpath('ShipDate')
      end

      attribute(:available_format_options_for_label) do
        xpath('AvailableFormatOptionsForLabel/LabelFormatOption').map { |node|
          AvailableFormatOptionsForLabel.new(node)
        }
      end
    end
  end
end
