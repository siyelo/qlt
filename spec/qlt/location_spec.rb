require 'spec_helper'

describe Qlt::Location do
	let(:location) { described_class.new({ latitude: 10.10, longitude: -15.12 })}

	it '#latitude - returns the latitude' do
		expect(location.latitude).to eq 10.10
	end

	it '#longitude - returns the longitude' do
		expect(location.longitude).to eq -15.12
	end

end