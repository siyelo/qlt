require 'spec_helper'

describe Qlt::Configuration do
  it 'accepts the API credentials' do
    Qlt.configure do |config|
      config.key = 'key123'
      config.secret = 'secret123'
      config.env = :production
    end

    expect(Qlt.configuration.secret).to eq 'secret123'
    expect(Qlt.configuration.key).to eq 'key123'
    expect(Qlt.configuration.env).to eq :production
  end
end