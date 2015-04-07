require 'spec_helper'

describe Qlt::API do
	describe '#basic - sends a basic lookup request' do
		it 'raises errors when missing lat or lng params' do
			expect{ Qlt::API.basic({ lat: 1}) }.to raise_error("Please provide longitude.")
			expect{ Qlt::API.basic({ lng: 1}) }.to raise_error("Please provide latitude.")
		end

		it 'returns a Qlt::Response object' do
			expect(Qlt::API.basic({ lat: 1, lng: 1})).to be_kind_of Qlt::Response
		end
	end

	describe '#advanced - TBA' do
	end
end