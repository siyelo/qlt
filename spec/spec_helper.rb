$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'qlt'

require 'rubygems'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end
