require 'spec_helper'

describe Qlt::Response do
	let(:raw_response) {
		%Q{
			{
				"lat":"-26.1226756",
				"lng":"28.0297304",
				"available_solutions":[
					{
						"zone":1,
						"type":"fibre1",
						"node_name":"Albury Road",
						"node_distance":"617.84305250635",
						"node_lat":"-26.128",
						"node_lng":"28.0315"
					},
					{
						"type":"wi_std",
						"highsite":"JHI",
						"distance":"1722",
						"highsite_lat":"-26.147403",
						"highsite_lng":"28.042114"
					}
				],
				"price": {
					"NRC": 123,
					"MRC": 321
				}
			}
		}
	}

	let(:response) { described_class.build(raw_response) }

	it '#location - returns the location' do
		expect(response.location).to be_kind_of Qlt::Location
		expect(response.location.latitude).to eq "-26.1226756"
		expect(response.location.longitude).to eq "28.0297304"
	end

	it '#price - returns the price of the connection' do
		expect(response.price).to be_kind_of Qlt::Price
		expect(response.price.nrc).to eq 123
		expect(response.price.mrc).to eq 321
	end

	describe '#solutions' do
		it 'returns an array of Qlt::Solution objects' do
			expect(response.solutions).to be_kind_of Array
			expect(response.solutions.first).to be_kind_of Qlt::Solution
		end
	end
end