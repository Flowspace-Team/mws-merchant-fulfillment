# frozen_string_literal: true

require "bundler/setup"
require_relative "../lib/mws-merchant_fulfillment"

module FixtureHelpers
  def load_xml_fixture(type)
    file = File.expand_path("../fixtures/#{type}.xml", __FILE__)
    body = File.read(file)

    Nokogiri(body)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FixtureHelpers
end
