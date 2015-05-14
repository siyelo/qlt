require 'spec_helper'


describe Qlt::ParamsMapper do

  let(:lookup_params) {
    {
      with_wireless: true,
      longitude: '12.12',
      latitude: '13.13',
      sla: 'business',
      speed: 10,
      contract_length: 24
    }
  }

  let(:create_params) {
    lookup_params.merge({
      :account_manager => 'John Doe',
      :company_name => 'Siyelo',
      :address => '5th Avenue 1000, NYC',
      :opt_ref => 'OPT-123-123'
    })
  }

  describe '.for_lookup' do
    it 'maps internal params to external (API) params for basic lookup' do
      mapping = described_class.for_lookup(lookup_params)
      expect(mapping[:wireless]).to eq lookup_params[:with_wireless]
      expect(mapping[:lng]).to eq lookup_params[:longitude]
      expect(mapping[:lat]).to eq lookup_params[:latitude]
      expect(mapping[:price]).to eq true
      expect(mapping[:sla]).to eq lookup_params[:sla]
      expect(mapping[:speed]).to eq lookup_params[:speed]
      expect(mapping[:term]).to eq lookup_params[:contract_length]
    end
  end

  describe '.for_create' do
    it 'maps internal params to external (API) params when creating a QLT entry' do
      mapping = described_class.for_create(create_params)
      expect(mapping[:wireless]).to eq create_params[:with_wireless]
      expect(mapping[:lng]).to eq create_params[:longitude]
      expect(mapping[:lat]).to eq create_params[:latitude]
      expect(mapping[:price]).to eq true
      expect(mapping[:sla]).to eq create_params[:sla]
      expect(mapping[:speed]).to eq create_params[:speed]
      expect(mapping[:term]).to eq create_params[:contract_length]
      expect(mapping[:OPT_ref]).to eq create_params[:opt_ref]
      expect(mapping[:am_name]).to eq create_params[:account_manager]
      expect(mapping[:address]).to eq create_params[:address]
      expect(mapping[:company_name]).to eq create_params[:company_name]
    end
  end

end