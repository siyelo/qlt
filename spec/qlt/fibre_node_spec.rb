require 'spec_helper'

describe Qlt::FibreNode do
  let(:solution_data) {
    {
      "zone"=>1,
      "type"=>"fiber1",
      "node_name"=>"AlburyRoad",
      "node_distance"=>"12",
      "node_lat"=>"-26.147403",
      "node_lng"=>"28.042114"
    }
  }

  let(:node) { described_class.new solution_data }

  it '#zone - returns the zone number' do
    expect(node.zone).to eq 1
  end

  it '#type - returns the type of the medium' do
    expect(node.type).to eq "fiber1"
  end

  it '#node_name - returns the name of the node' do
    expect(node.name).to eq "AlburyRoad"
  end

  it '#distance - returns the distance of the node' do
    expect(node.distance).to eq "12"
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