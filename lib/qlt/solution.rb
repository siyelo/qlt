class Qlt::Solution
	attr_reader :zone, :type, :node_name, :node_distance, :node_latitude, :node_longitude

	def initialize solution
		@zone = solution['zone']
		@type = solution['type']
		@node_name = solution['node_name']
		@node_distance = solution['node_distance']
		@node_latitude = solution['node_lat']
		@node_longitude = solution['node_lng']
	end
end