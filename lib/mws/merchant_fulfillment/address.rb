# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class Address < Entity
      attribute(:city) do
        text_at_xpath('City')
      end

      attribute(:phone) do
        text_at_xpath('Phone')
      end

      attribute(:country_code) do
        text_at_xpath('CountryCode')
      end

      attribute(:postal_code) do
        text_at_xpath('PostalCode')
      end

      attribute(:name) do
        text_at_xpath('Name')
      end

      attribute(:address_line_1) do
        text_at_xpath('AddressLine1')
      end

      attribute(:state_or_province_code) do
        text_at_xpath('StateOrProvinceCode')
      end

      attribute(:email) do
        text_at_xpath('Email')
      end
    end
  end
end
