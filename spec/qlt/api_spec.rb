require 'spec_helper'

describe Qlt::API do
  describe '#basic - sends a basic lookup request' do
    it 'returns a Qlt::Response object' do
      expect(Qlt::API.basic({ lat: 1, lng: 1, wireless: false})).to be_kind_of Qlt::Response
    end
  end

  describe '#advanced - TBD' do
  end
end
