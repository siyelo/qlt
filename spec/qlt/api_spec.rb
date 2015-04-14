require 'spec_helper'

describe Qlt::API do
  before :each do
    Qlt.configure do |c|
      c.env = :development
    end
  end

  describe '#prices_lookup - sends a basic lookup request' do
    it 'returns a Qlt::Response object' do
      VCR.use_cassette('pricing_request') do
        expect(described_class.prices_lookup({ latitude: -26.5583, longitude: 28.0197, with_wireless: true, speed: 10, contract_length: 36})).to be_kind_of Qlt::Response
      end
    end

    it 'raises ArgumentError if missing required params' do
      expect{
        described_class.prices_lookup({ latitude: 1 })
      }.to raise_error(ArgumentError)

      expect{
        described_class.prices_lookup({ longitude: 1 })
      }.to raise_error(ArgumentError)

      expect{
        described_class.prices_lookup({ latitude: 1, longitude: 1})
      }.to raise_error(ArgumentError)

      expect{
        described_class.prices_lookup({ latitude: 1, longitude: 1, speed: 1})
      }.to raise_error(ArgumentError)

      expect{
        described_class.prices_lookup({ latitude: 1, longitude: 1, speed: 1, contract_length: 12})
      }.to_not raise_error
    end
  end

end
