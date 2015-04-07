require 'spec_helper'

describe Qlt::Price do
	let(:price) { described_class.new({ nrc: 100, mrc: 200 })}

	it '#nrc - returns the non-recurring price' do
		expect(price.nrc).to eq 100
	end

	it '#mrc - returns the monthly recurring price' do
		expect(price.mrc).to eq 200
	end

end