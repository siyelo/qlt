class Qlt::NodesFactory
  class << self

    def build available_solutions
      return [] unless available_solutions
      available_solutions.collect do |s|
        if ['fibre1', 'fibre2'].include?(s['type'])
          Qlt::FibreNode.new(s)
        else
          Qlt::WiFiNode.new(s)
        end
      end
    end

  end
end