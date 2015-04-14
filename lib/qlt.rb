require "qlt/api"
require "qlt/version"
require "qlt/configuration"
require "qlt/price"
require "qlt/location"
require "qlt/response"
require "qlt/nodes_factory"
require "qlt/fibre_node"
require "qlt/wifi_node"

module Qlt
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def lookup attrs
      Qlt::API.prices_lookup(attrs)
    end
  end
end
