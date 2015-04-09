require 'spec_helper'

describe Qlt::API do
  before :each do
    Qlt.configure do |c|
      c.env = :development
    end
  end

  describe '#basic - sends a basic lookup request' do
    it 'returns a Qlt::Response object' do
      VCR.use_cassette('zone2_request') do
        expect(Qlt::API.basic({ lat: 1, lng: 1, wireless: false})).to be_kind_of Qlt::Response
      end
    end
  end

  describe '#advanced - TBD' do
  end
end
