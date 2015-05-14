require "qlt/api"
require "qlt/version"
require "qlt/configuration"
require "qlt/price"
require "qlt/location"
require "qlt/response"
require "qlt/nodes_factory"
require "qlt/fibre_node"
require "qlt/wifi_node"
require "qlt/params_validator"
require "qlt/params_mapper"

module Qlt
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def lookup params
      if Qlt::ParamsValidator.validate params
        mapped_params = Qlt::ParamsMapper.for_lookup params
        Qlt::API.prices_lookup mapped_params
      end
    end

    def register params
      if Qlt::ParamsValidator.validate params
        mapped_params = Qlt::ParamsMapper.for_create params
        Qlt::API.prices_lookup mapped_params
      end
    end

  end
end
