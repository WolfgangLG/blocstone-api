class GlassdoorEmployer < ActiveRecord::Base

  validates :employer_id, :uniqueness => true

  def self.to_csv
    attributes = %w{id name website industry numberOfRatings overallRating ratingDescription cultureAndValuesRating seniorLeadershipRating
                        compensationAndBenefitsRating careerOpportunitiesRating workLifeBalanceRating }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |employer|
        csv << attributes.map{ |attr| employer.send(attr) }
      end
    end
  end

end
