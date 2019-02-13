# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'
require 'mws/merchant_fulfillment/file_contents'
require 'mws/merchant_fulfillment/dimensions'

module MWS
  module MerchantFulfillment
    class Label < Entity
      attribute(:file_contents) do
        node = xpath('FileContents').first
        FileContents.new(node)
      end

      attribute(:label_format) do
        text_at_xpath('LabelFormat')
      end

      attribute(:dimensions) do
        node = xpath('Dimensions').first
        Dimensions.new(node)
      end
    end
  end
end
