class Qlt::Configuration
  attr_accessor :key, :secret, :env

  def initialize
    @env = :development
  end
end