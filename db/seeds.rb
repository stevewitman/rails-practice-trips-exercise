20.times do |i|
  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name
  )
end
