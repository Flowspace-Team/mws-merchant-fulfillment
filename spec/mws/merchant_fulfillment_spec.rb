# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MWS::MerchantFulfillment do
  it "has a version number" do
    expect(MWS::MerchantFulfillment::VERSION).not_to be nil
  end
end
