class Qlt::Location
  attr_reader :latitude, :longitude

  def initialize attrs
    @latitude  = attrs.fetch(:latitude, 0.0)
    @longitude = attrs.fetch(:longitude, 0.0)
  end

end