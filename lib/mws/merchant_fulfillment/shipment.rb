# frozen_string_literal: true

require 'mws/merchant_fulfillment/address'
require 'mws/merchant_fulfillment/entity'
require 'mws/merchant_fulfillment/item'
require 'mws/merchant_fulfillment/label'
require 'mws/merchant_fulfillment/package_dimensions'
require 'mws/merchant_fulfillment/shipping_service'
require 'mws/merchant_fulfillment/weight'

module MWS
  module MerchantFulfillment
    class Shipment < Entity
      attribute(:insurance) do
        money_at_xpath('Insurance')
      end

      attribute(:ship_to_address) do
        node = xpath('ShipToAddress').first
        Address.new(node) if node
      end

      attribute(:amazon_order_id) do
        text_at_xpath('AmazonOrderId')
      end

      attribute(:weight) do
        node = xpath('Weight').first
        Weight.new(node) if node
      end

      attribute(:label) do
        node = xpath('Label').first
        Label.new(node) if node
      end

      attribute(:shipping_service) do
        node = xpath('ShippingService').first
        ShippingService.new(node) if node
      end

      attribute(:package_dimensions) do
        node = xpath('PackageDimensions').first
        PackageDimensions.new(node) if node
      end

      attribute(:created_date) do
        time_at_xpath('CreatedDate')
      end

      attribute(:last_updated_date) do
        time_at_xpath('LastUpdatedDate')
      end

      attribute(:ship_from_address) do
        node = xpath('ShipFromAddress').first
        Address.new(node) if node
      end

      attribute(:item_list) do
        xpath('ItemList/Item').map { |node| Item.new(node) }
      end

      attribute(:status) do
        text_at_xpath('Status')
      end

      attribute(:tracking_id) do
        text_at_xpath('TrackingId')
      end

      attribute(:shipment_id) do
        text_at_xpath('ShipmentId')
      end

      attribute(:seller_order_id) do
        text_at_xpath('SellerOrderId')
      end
    end
  end
end
