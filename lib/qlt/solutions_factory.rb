class Qlt::SolutionsFactory
	class << self

		def build available_solutions
			available_solutions.collect do |s|
				Qlt::Solution.new(s)
			end
		end

	end
end