class Qlt::Location
  attr_reader :latitude, :longitude

  def initialize attrs
    @latitude = attrs[:latitude] || 0.0
    @longitude = attrs[:longitude] || 0.0
  end

end