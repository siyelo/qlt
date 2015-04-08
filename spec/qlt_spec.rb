require 'spec_helper'

describe Qlt do
  it 'has a version number' do
    expect(Qlt::VERSION).not_to be nil
  end

  describe '#basic' do
    before :each do
      Qlt.configure do |c|
        c.env = :development
      end
    end

    it 'sends a basic request for available solutions' do
      expect(Qlt.basic({ latitude: 1, longitude: 1, wireless: true})).to be_kind_of Qlt::Response
    end

    it 'raises exceptions if missing required params' do
      expect{
        Qlt.basic({ latitude: 1 })
      }.to raise_error("Please provide longitude.")

      expect{
        Qlt.basic({ longitude: 1 })
      }.to raise_error("Please provide latitude.")

      expect{
        Qlt.basic({ latitude: 1, longitude: 1})
      }.to raise_error("Please provide the wireless flag (true/false).")
    end
  end
end
