require 'spec_helper'

describe Qlt do
  it 'has a version number' do
    expect(Qlt::VERSION).not_to be nil
  end

  describe '#prices' do
    before :each do
      Qlt.configure do |c|
        c.env = :development
      end
    end

    it 'sends a prices lookup request for available solutions' do
      VCR.use_cassette("pricing_request") do
        result = Qlt.prices({ latitude: -26.5583, longitude: 28.0197, wireless: true, speed: 10, term: 36})
        expect(result).to be_kind_of Qlt::Response
        expect(result.solutions.first.zone).to eq 2
        expect(result.solutions.first.type).to eq 'fibre2'
        expect(result.solutions.first.name).to eq 'Meyerton'
        expect(result.solutions.first.distance).to eq "583.76017612524"
        expect(result.solutions.first.location.latitude).to eq "-26.557097"
        expect(result.solutions.first.location.longitude).to eq "28.013987"
      end
    end

  end
end
