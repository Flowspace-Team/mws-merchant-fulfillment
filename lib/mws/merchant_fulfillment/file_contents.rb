# frozen_string_literal: true

require 'mws/merchant_fulfillment/entity'

module MWS
  module MerchantFulfillment
    class FileContents < Entity
      attribute(:checksum) do
        text_at_xpath('Checksum')
      end

      attribute(:contents) do
        text_at_xpath('Contents')
      end

      attribute(:file_type) do
        text_at_xpath('FileType')
      end
    end
  end
end
