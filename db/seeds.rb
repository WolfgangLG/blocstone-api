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

puts "Seed finished"
puts "#{User.count} users created"
