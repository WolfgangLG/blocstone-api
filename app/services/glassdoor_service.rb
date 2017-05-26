require 'httparty'

class GlassdoorService
  include HTTParty

  def initialize(user)
    @glassdoor_partner = user.glassdoor_partner_id
    @glassdoor_key = user.glassdoor_key
  end

  # Find company on Glassdoor by name
  def find_employer(company, options = {})
    api_url = "http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=#{ @glassdoor_partner }&t.k=#{ @glassdoor_key }"
    url = "#{ api_url }&action=employers&ps=1&q=#{ company }"
    response = HTTParty.get(url, options)
    json = JSON.parse(response.body)
    json["response"]["employers"][0]
  end
end
