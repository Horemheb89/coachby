# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Destroying previous instances
User.destroy_all
Contract.destroy_all

# Seeding Starts
puts "\n🌱 Seeding 🌱"

# Creating specific Coach users
data = [{
  email: "hugo@coachby.com",
  last_name: "Bottois",
  first_name: "Hugo"
}, {
  email: "caroline@coachby.com",
  last_name: "Trenet",
  first_name: "Caroline"
}, {
  email: "quentin@coachby.com",
  last_name: "Rouillon",
  first_name: "Quentin"
}, {
  email: "hadrien@coachby.com",
  last_name: "Cheru",
  first_name: "Hadrien"
}]

data.each do |team_member|
  user = User.new(team_member)
  user.password = "123456"
  user.is_coach = true
  puts "User created - Coach #{user.first_name}" if user.save
end

# Done
puts "\n🌱 Done 🌱"
puts "You have #{User.count} users."
puts "You have #{Contract.count} contracts."


# puts "5 coach"

# 5.times do
#   User.create!(email: Faker::Internet.email,
#                   password: "123456",
#                   is_coach: true,
#                   last_name: Faker::Name.last_name ,
#                   first_name: Faker::Name.first_name)
# end

# puts "10 coach"


# 10.times do
#   User.create!(email: Faker::Internet.email,
#                   password: "123456",
#                   is_coach: false,
#                   last_name: Faker::Name.last_name ,
#                   first_name: Faker::Name.first_name )
# end
