require 'httparty'

class GlassdoorService
  include HTTParty

  def initialize(user)
    @user = user
  end

  # Find company on Glassdoor by name
  def find_employer(company, options = {})
    api_url = "http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=#{ glassdoor_partner }&t.k=#{ glassdoor_key }"
    url = "#{ api_url }&action=employers&ps=1&q=#{ company }"
    response = HTTParty.get(url, options)
    json = JSON.parse(response.body)
    single_employer = json["response"]["employers"]

    gd_employer = single_employer.map do |atr|
      gd = GlassdoorEmployer.new
      gd.employer_id = atr["id"]
      gd.name = atr["name"]
      gd.website = atr["website"]
      gd.industry = atr["industry"]
      gd.squareLogo = atr["squareLogo"]
      gd.numberOfRatings = atr["numberOfRatings"]
      gd.overallRating = atr["overallRating"]
      gd.ratingDescription = atr["ratingDescription"]
      gd.cultureAndValuesRating = atr["cultureAndValuesRating"]
      gd.seniorLeadershipRating = atr["seniorLeadershipRating"]
      gd.compensationAndBenefitsRating = atr["compensationAndBenefitsRating"]
      gd.careerOpportunitiesRating = atr["careerOpportunitiesRating"]
      gd.workLifeBalanceRating = atr["workLifeBalanceRating"]
      gd.save!
      gd
    end
    gd_employer.select(&:persisted?)
  end

  private

  def glassdoor_partner
    @glassdoor_partner = @user.glassdoor_partner_id
  end

  def glassdoor_key
    @glassdoor_key = @user.glassdoor_key
  end
end
