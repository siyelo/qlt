require "net/http"

class Qlt::API

  class << self

    def prices_lookup attrs
      new(attrs).prices_lookup
    end

  end

  def initialize attrs
    @attrs = attrs
  end

  def prices_lookup
    uri = URI.parse(api_url)
    uri.query = URI.encode_www_form(build_params)
    http = Net::HTTP.new(uri.host, uri.port)

    req = Net::HTTP::Get.new(uri.request_uri)
    req.add_field("X-Key", Qlt.configuration.key)
    req.add_field("X-Secret", Qlt.configuration.secret)

    body = http.request(req).body

    Qlt::Response.build(body)
  end

  private

  def filter_params
    raise ArgumentError.new("missing :latitude") if @attrs[:latitude].nil?
    raise ArgumentError.new("missing :longitude") if @attrs[:longitude].nil?
    raise ArgumentError.new("missing :speed") if @attrs[:speed].nil?
    raise ArgumentError.new("missing :contract_length") if @attrs[:contract_length].nil?
  end

  def build_params
    filter_params

    {
      wireless: @attrs[:with_wireless] || true,
      lng: @attrs[:longitude],
      lat: @attrs[:latitude],
      price: true,
      sla: @attrs[:sla] || 'economy',
      speed: @attrs[:speed],
      term: @attrs[:contract_length]
    }
  end

  def api_url
    if Qlt.configuration.env == :production
      "http://awsm.co.za/is/api/json.php"
    else
      "http://demo.awsm.co.za/is/api/json.php"
    end
  end

end