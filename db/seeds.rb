
# Destroying previous instances
User.destroy_all
Contract.destroy_all


# Seeding Starts
puts "\n🌱 Seeding Starts 🌱"


coach_data = [{
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

# Creating Coaches

coach_data.each do |member|
  coach = User.new(member)
  coach.password = "123456"
  coach.is_coach = true
  puts "\n🗣  Coach created - #{coach.first_name} | email: #{coach.email} | password: #{coach.password}" if coach.save


  # Creating random Athletes for each Coach

  rand(5..15).times do
    athlete = User.new(email: Faker::Internet.email,
                    password: "123456",
                    is_coach: false,
                    last_name: Faker::Name.last_name,
                    first_name: Faker::Name.first_name )
    print " ◽️  Athlete created - #{athlete.first_name}. " if athlete.save


    # Creating Contracts for each Coach

    contract = Contract.new(coach_id: coach.id, athlete_id:athlete.id)
    puts "Contract created (#{athlete.first_name} and #{coach.first_name})." if contract.save
  end
end

# Creating main Athlete

athlete = User.new(email: "usain@athlete.com",
                password: "123456",
                is_coach: false,
                last_name: "Bolt",
                first_name: "Usain")
puts "\n🥇 Athlete Created - #{athlete.first_name} | email: #{athlete.email} | password: #{athlete.password}" if athlete.save


# Creating random Athletes without contracts

puts "\n👥 Creating Random Athletes"
10.times do
  athlete = User.new(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: false,
                  last_name: Faker::Name.last_name,
                  first_name: Faker::Name.first_name )
  puts " ◽️  Athlete Created - #{athlete.first_name}" if athlete.save
end

# Done
puts "\n🌱 Seeding Completed 🌱"
puts "You have #{User.count} users."
puts "You have #{Contract.count} contracts."


Ingredient.destroy_all

require 'roo'
require 'roo-xls'

path = 'db/table.xls'
xlsx = Roo::Spreadsheet.open path

tab = []

xlsx.each(category: 'alim_ssssgrp_nom_fr',
                name: 'alim_nom_fr',
                proteins: 'Protéines (g/100g)',
                fats: 'Glucides (g/100g)',
                carbs: 'Glucides (g/100g)') do |a|
                # fibre: 'Fibres alimentaires (g/100g)',
                # sel: 'Sel chlorure de sodium (g/100g)')
  tab << a
end

tab.each_with_index do |item, index|
  if index == 0
    puts "columns name"
  else
    puts item[:name]
    Ingredient.create!(name: item[:name],
      category: item[:category],
      proteins: item[:proteins],
      fats: item[:fats],
      carbs: item[:carbs])
  end
end

exercises = ["air squat", "alligator walk", "barbell thrusters", "bench press", "box jump", "burpees", "clean and jerk", "deadlift", "dips", "double under", "front squat", "handstand pushup", "hip raise", "hollow rock/hold", "kettlebell swing", "knees to elbows", "lunges", "muscle up", "overhead squat", "power clean" , "pistol squat", "pulls up", "push ups", "push press", "rose climb", "sumo deadlift", "squat", "shoulder press", "snatch", "wall ball"]
