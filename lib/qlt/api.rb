require "net/http"

module Qlt
  class API

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
      uri.query = URI.encode_www_form(@attrs)
      http = Net::HTTP.new(uri.host, uri.port)

      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field("X-Key", Qlt.configuration.key) if Qlt.configuration.key
      req.add_field("X-Secret", Qlt.configuration.secret) if Qlt.configuration.secret

      body = http.request(req).body

      Qlt::Response.build(body)
    end

    private
    def api_url
      if Qlt.configuration.env == :production
        "http://awsm.co.za/is/api/json.php"
      else
        "http://demo.awsm.co.za/is/api/json.php"
      end
    end

  end
end