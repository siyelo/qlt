require "qlt/api"
require "qlt/version"
require "qlt/configuration"
require "qlt/price"
require "qlt/location"
require "qlt/response"
require "qlt/solutions_factory"
require "qlt/solution"

module Qlt
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def basic attrs
    	Qlt::API.basic(attrs)
  	end

  end
end
