User.create!(
  username:       "Ludwig Gerdes",
  email:          "gerdesludwig@gmail.com",
  password:       "password",
  confirmed_at:   Date.today,
  glassdoor_partner_id: ENV["glassdoor_partner_id"],
  glassdoor_key: ENV["glassdoor_key"]
)

5.times do
  User.create!(
    username:     Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    confirmed_at: Date.today
  )
end
users = User.all

5.times do
  nm = Faker::App.name
  GlassdoorEmployer.create!(
    name:                          nm,
    employer_id:                   Random.rand(1000),
    website:                       "www.#{nm.gsub(" ","").downcase}.com",
    industry:                      Faker::Job.field,
    squareLogo:                    Faker::Company.logo,
    numberOfRatings:               Random.rand(1..100),
    overallRating:                 Random.rand(4.0),
    ratingDescription:             Faker::Lorem.word,
    cultureAndValuesRating:        Random.rand(4.0),
    seniorLeadershipRating:        Random.rand(4.0),
    compensationAndBenefitsRating: Random.rand(4.0),
    careerOpportunitiesRating:     Random.rand(4.0),
    workLifeBalanceRating:         Random.rand(4.0)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{GlassdoorEmployer.count} employers created"
