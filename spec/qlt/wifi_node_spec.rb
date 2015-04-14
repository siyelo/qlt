require 'spec_helper'

describe Qlt::WiFiNode do
  let(:solution_data) {
    {
      "type" => "wi_std",
      "highsite" => "JHI",
      "distance" => "1722",
      "highsite_lat" => "-26.147403",
      "highsite_lng" => "28.042114"
    }
  }

  let(:node) { described_class.new solution_data }

  it '#type - returns the type of the medium' do
    expect(node.type).to eq "wi_std"
  end

  it '#name - returns the name of the node' do
    expect(node.name).to eq "JHI"
  end

  it '#distance - returns the distance of the node' do
    expect(node.distance).to eq "1722"
  end

  describe '#location' do
    it '#latitude - returns the node latitude' do
      expect(node.location.latitude).to eq "-26.147403"
    end
    it '#longitude - returns the node longitude' do
      expect(node.location.longitude).to eq "28.042114"
    end
  end
end