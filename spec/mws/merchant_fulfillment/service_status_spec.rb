# frozen_string_literal: true

RSpec.describe MWS::MerchantFulfillment::ServiceStatus do
  let(:instance) { described_class.new(node) }
  let(:node) { load_xml_fixture('service_status').xpath('//xmlns:GetServiceStatusResult').first }

  describe '#status' do
    subject { instance.status }
    it { is_expected.to be_a(String) }
  end

  describe '#timestamp' do
    subject { instance.timestamp }
    it { is_expected.to be_a(Time) }
  end

  describe '#message_id' do
    subject { instance.message_id }
    it { is_expected.to be_a(String) }
  end

  describe '#messages' do
    subject { instance.messages }
    it { is_expected.to be_a(Array) }
  end
end
