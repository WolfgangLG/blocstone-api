FactoryGirl.define do
  nm = Faker::Company.name
  factory :glassdoor_employer do
    name                           nm
    sequence(:employer_id) { |n| n }
    website                        "www.#{nm.gsub(" ","").downcase}.com"
    industry                       Faker::Job.field
    squareLogo                     Faker::Company.logo
    numberOfRatings                Random.rand(1..100)
    overallRating                  Random.rand(4.0)
    ratingDescription              Faker::Lorem.word
    cultureAndValuesRating         Random.rand(4.0)
    seniorLeadershipRating         Random.rand(4.0)
    compensationAndBenefitsRating  Random.rand(4.0)
    careerOpportunitiesRating      Random.rand(4.0)
    workLifeBalanceRating          Random.rand(4.0)

  end
end
