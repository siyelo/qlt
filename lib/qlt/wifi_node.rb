class Qlt::WiFiNode
  attr_reader :type, :name, :distance, :location

  def initialize solution
    @type = solution['type']
    @name = solution['highsite']
    @distance = solution['distance']
    @location = Qlt::Location.new({ latitude: solution['highsite_lat'], longitude: solution['highsite_lng'] })
  end

end