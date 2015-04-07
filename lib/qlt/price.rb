class Qlt::Price
	attr_reader :nrc, :mrc

	def initialize attrs
		@nrc = attrs[:nrc] || 0
		@mrc = attrs[:mrc] || 0
	end

end