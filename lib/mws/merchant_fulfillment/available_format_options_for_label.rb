# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class AvailableFormatOptionsForLabel < Entity
      attribute(:include_packing_slip_with_label) do
        boolean_at_path('IncludePackingSlipWithLabel')
      end

      attribute(:label_format) do
        text_at_xpath('LabelFormat')
      end
    end
  end
end
