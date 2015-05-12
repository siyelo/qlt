require 'json'

class Qlt::Response
  class << self
    def build raw_response
      new(raw_response)
    end
  end

  attr_reader :location, :price, :solutions, :reference_number

  def initialize response_body
    @data = JSON.parse(response_body)
    @location = Qlt::Location.new({ latitude: @data['lat'], longitude: @data['lng'] })
    @price = Qlt::Price.new({ nrc: prices['NRC'], mrc: prices['MRC'] })
    @solutions = Qlt::NodesFactory.build(@data['available_solutions'])
    @reference_number = @data.fetch("QLT_ref", "")
  end

  private

  def prices
    @data['price'] || { 'NRC' => 0.0, 'MRC' => 0.0 }
  end
end