class Qlt::FibreNode
  attr_reader :zone, :type, :name, :distance, :location

  def initialize solution
    @zone = solution['zone']
    @type = solution['type']
    @name = solution['node_name']
    @distance = solution['node_distance']
    @location = Qlt::Location.new({ latitude: solution['node_lat'], longitude: solution['node_lng'] })
  end

end
