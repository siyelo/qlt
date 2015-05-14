require 'spec_helper'

describe Qlt do
  it 'has a version number' do
    expect(Qlt::VERSION).not_to be nil
  end

  context 'LM prices' do
    before :each do
      Qlt.configure do |c|
        c.env = :development
      end
    end

    it '#lookup - sends a prices lookup request for available solutions' do
      VCR.use_cassette("price_lookup") do
        result = Qlt.lookup({ latitude: -26.5583, longitude: 28.0197,
          with_wireless: true, speed: 10, contract_length: 36})
        expect(result).to be_kind_of Qlt::Response
        expect(result.solutions.first.zone).to eq 2
        expect(result.solutions.first.type).to eq 'fibre2'
        expect(result.solutions.first.name).to eq 'Meyerton'
        expect(result.solutions.first.distance).to eq "583.76017612524"
        expect(result.solutions.first.location.latitude).to eq "-26.557097"
        expect(result.solutions.first.location.longitude).to eq "28.013987"
      end
    end

    it '#register - creates an LM solution entry on QLT side' do
      VCR.use_cassette("register_solution") do
        result = Qlt.register({ latitude: -26.5583, longitude: 28.0197,
          with_wireless: true, speed: 10, contract_length: 36})
        expect(result).to be_kind_of Qlt::Response
        expect(result.solutions.first.zone).to eq 2
        expect(result.solutions.first.type).to eq 'fibre2'
        expect(result.solutions.first.name).to eq 'Meyerton'
        expect(result.solutions.first.distance).to eq "583.76017612524"
        expect(result.solutions.first.location.latitude).to eq "-26.557097"
        expect(result.solutions.first.location.longitude).to eq "28.013987"
        expect(result.reference_number).to eq "IS-55534d62de0fd"
      end
    end
  end
end