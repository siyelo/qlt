require "qlt/version"
require "qlt/configuration"
require "qlt/price"
require "qlt/location"

module Qlt
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
