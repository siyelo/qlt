class Qlt::Price
  attr_reader :nrc, :mrc

  def initialize attrs
    @nrc = attrs.fetch(:nrc, 0)
    @mrc = attrs.fetch(:mrc, 0)
  end

end