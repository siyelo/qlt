require 'spec_helper'

describe Qlt do
  it 'has a version number' do
    expect(Qlt::VERSION).not_to be nil
  end

  describe 'Configuration' do
  	it 'accepts the API credentials' do
  		Qlt.configure do |config|
  			config.key = 'key123'
  			config.secret = 'secret123'
  		end

  		expect(Qlt.configuration.secret).to eq 'secret123'
  		expect(Qlt.configuration.key).to eq 'key123'
  	end
  end
end
