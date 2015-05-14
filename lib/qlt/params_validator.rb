class Qlt::ParamsValidator

  def self.validate attributes
    new(attributes).validate
  end

  def initialize attributes
    @attributes = attributes
  end

  def validate
    raise ArgumentError.new("missing :latitude") if @attributes[:latitude].nil?
    raise ArgumentError.new("missing :longitude") if @attributes[:longitude].nil?
    raise ArgumentError.new("missing :speed") if @attributes[:speed].nil?
    raise ArgumentError.new("missing :contract_length") if @attributes[:contract_length].nil?
    true
  end
end