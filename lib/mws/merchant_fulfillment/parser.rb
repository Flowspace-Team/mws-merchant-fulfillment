# frozen_string_literal: true

require 'peddler'
require 'nokogiri'
require 'mws/merchant_fulfillment/service_status'
require 'mws/merchant_fulfillment/shipping_services'
require 'mws/merchant_fulfillment/shipment'

module MWS
  module MerchantFulfillment
    class Parser
      include ::Peddler::Headers

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        node = find_result_node

        case node.name
        when /GetServiceStatus/
          ServiceStatus.new(node)
        when /GetEligibleShippingServices/
          ShippingServices.new(node)
        when /CreateShipment/
          shipment_node = node.children.find { |node| node.name == 'Shipment' }
          Shipment.new(shipment_node)
        when /CancelShipment/
          shipment_node = node.children.find { |node| node.name == 'Shipment' }
          Shipment.new(shipment_node)
        else
          raise NotImplementedError
        end
      end

      def headers
        @response.headers
      end

      def status_code
        @response.status
      end

      def body
        @response.body
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
