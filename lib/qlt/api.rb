require "net/http"

class Qlt::API

  class << self

    def basic attrs
      new(attrs).basic
    end

    def prices
      new(attrs).prices
    end

  end

  def initialize attrs
    @attrs = attrs
  end

  def basic
    uri = URI(api_url)
    uri.query = URI.encode_www_form(build_params)
    body = Net::HTTP.get_response(uri).body
    Qlt::Response.build(body)
  end

  def prices
    raise "TO BE IMPLEMENTED"
  end

  private

  def build_params
    { wireless: @attrs[:wireless], lng: @attrs[:longitude], lat: @attrs[:latitude] }
  end

  def api_url
    if Qlt.configuration.env == :production
      "http://awsm.co.za/is/api/json.php"
    else
      "http://demo.awsm.co.za/is/api/json.php"
    end
  end

end