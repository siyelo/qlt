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

    def basic attrs
      raise "Please provide latitude." if attrs[:latitude].nil?
      raise "Please provide longitude." if attrs[:longitude].nil?
      raise "Please provide the wireless flag (true/false)." if attrs[:wireless].nil?
      Qlt::API.basic(attrs)
    end

  end
end
