require "net/http"

class Qlt::API
	TEST_API = "http://demo.awsm.co.za/is/api/json.php"

	class << self

		def basic attrs
			raise "Please provide latitude." if attrs[:lat].nil?
			raise "Please provide longitude." if attrs[:lng].nil?
			uri = URI(TEST_API)
			uri.query = URI.encode_www_form(attrs)
			res = Net::HTTP.get_response(uri)
			Qlt::Response.build(res.body)
		end

	end
end