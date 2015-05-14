require 'spec_helper'

describe Qlt::ParamsValidator do

  let(:valid_attributes){
    {
      latitude: '21.21',
      longitude: '12.23',
      speed: 20,
      contract_length: 36
    }
  }

  describe '#validate' do
    [:latitude, :longitude, :speed, :contract_length].each do |attr|
      it "raises ArgumentError if #{attr} is missing" do
        attrs = valid_attributes.tap {|h| h.delete(attr) }
        validator = described_class.new(attrs)
        expect{ validator.validate }.to raise_error ArgumentError
      end
    end
  end
end