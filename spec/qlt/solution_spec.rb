require 'spec_helper'

describe Qlt::Solution do
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

	let(:solution) { described_class.new solution_data }

	it '#zone - returns the zone number' do
		expect(solution.zone).to eq 1
	end

	it '#type - returns the type of the medium' do
		expect(solution.type).to eq "fiber1"
	end

	it '#node_name - returns the name of the node' do
		expect(solution.node_name).to eq "AlburyRoad"
	end

	it '#node_distance - returns the distance of the node' do
		expect(solution.node_distance).to eq "12"
	end

	it '#node_latitude - returns the latitude of the node' do
		expect(solution.node_latitude).to eq "-26.147403"
	end

	it '#node_longitude - returns the longitude of the node' do
		expect(solution.node_longitude).to eq "28.042114"
	end

end