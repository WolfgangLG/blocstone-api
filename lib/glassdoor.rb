require 'httparty'

class Glassdoor
  include HTTParty
  base_uri 'http://api.glassdoor.com'

  def glassdoor_partner
    ENV['glassdoor_partner_id']
  end

  def glassdoor_key
    ENV['glassdoor_key']
  end

  # Authentication requires the user's glassdoor partner id and key
  def base_path
    "/api/api.htm?v=1&format=json&t.p=#{ glassdoor_partner }&t.k=#{ glassdoor_key }"
  end

  # Find company on Glassdoor by name
  def find_employer(company, options = {})
    url = "#{ base_path }&action=employers&ps=1&q=#{ company }"
    response = self.class.get(url, options)
    employers = response.parsed_response["response"]["employers"][0]

    # if response.success?
    #   employers.each do |employer|
    #     p employer["name"]
    #     p employer["website"]
    #     p employer["industry"]
    #   end
    # else
    #   raise response.response
    # end
  end
end
