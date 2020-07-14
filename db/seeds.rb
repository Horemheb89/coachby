
require 'roo'
require 'roo-xls'


# Seeding Starts
puts "\n🌱 Seeding Starts 🌱"



# Destroying previous instances
puts "\n🗑  Destroying Dose instances."
Dose.destroy_all
puts "Success!"

puts "\n🗑  Destroying User instances."
User.destroy_all
puts "Success!"

puts "\n🗑  Destroying Contract instances."
Contract.destroy_all
puts "Success!"

puts "\n🗑  Destroying Ingredient instances."
Ingredient.destroy_all
puts "Success!"

puts "\n🗑  Destroying Meal instances."
Meal.destroy_all
puts "Success!"

puts "\n🗑  Destroying Program instances."
Program.destroy_all
puts "Success!"

puts



# Seeding Ingredients
path = 'db/table.xls'
xlsx = Roo::Spreadsheet.open path

tab = []

xlsx.each(category: 'alim_ssssgrp_nom_fr',
                name: 'alim_nom_fr',
                proteins: 'Protéines (g/100g)',
                fats: 'Lipides (g/100g)',
                carbs: 'Glucides (g/100g)') do |a|
                # fibre: 'Fibres alimentaires (g/100g)',
                # sel: 'Sel chlorure de sodium (g/100g)')
  tab << a
  # Smaller ingredients table
  tab = tab.sample(500)
end

tab.each_with_index do |item, index|
  if index == 0
    puts "columns name"
  else
    Ingredient.create!(name: item[:name],
      category: item[:category],
      proteins: item[:proteins],
      fats: item[:fats],
      carbs: item[:carbs])
    puts "🍉  Ingredient created (#{index}/#{tab.count})"
  end
end



# Seeding Coach
coach_data = {
  email: "coach@coachby.com",
  last_name: "Mignard",
  first_name: "Sixtine",
  password: "123456",
  is_coach: true
}

coach = User.new(coach_data)
puts "\n🗣  Coach created - #{coach.first_name} | email: #{coach.email} | password: #{coach.password}" if coach.save



# Seeding random Athletes for each Coach
weight = [55,80,90,100,70,80]
height = [180,155,160,170,170,175]

5.times do
  athlete = User.new(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: false,
                  last_name: Faker::Name.last_name,
                  first_name: Faker::Name.first_name,
                  weight: weight.sample,
                  height: height.sample,
                  dob: Faker::Date.between(from: '1960-09-23', to: '2000-09-25'))
  print "\n⚪️  Athlete created - #{athlete.first_name}. " if athlete.save



  # Seeding Contracts for each Coach
  contract = Contract.new(coach_id: coach.id, athlete_id:athlete.id)
  print "Contract created (#{athlete.first_name} and #{coach.first_name})." if contract.save



  # Seeding Programs for each Contract
  proteins = [320, 340, 280]
  fats = [200, 220, 180]
  carbs = [300, 320, 280]

  program = Program.new(proteins_target: proteins.sample,
    fats_target: fats.sample,
    carbs_target: carbs.sample,
    contract_id: contract.id)
  puts "Program created." if program.save



  # Seeding Meals
  name_meals = ["petit-dejeuner" ,"dejeuner" ,"gouter" ,"diner"]
  d = Date.today

  rand(15..30).times do
    d += 1
    name_meals.sample(rand(1..3)).each do |name_meal|
      mealday = Meal.new(name: name_meal,
                      start_time: (d))
      mealday.program = program
      puts "\n    ⚪️  Meal created - #{name_meal.capitalize} (#{d})" if mealday.save

      quantity = [50,100,150,200]

      rand(2..4).times do
        rand_id = rand(Ingredient.count)
        dosemeal = Dose.create(quantity: quantity.sample ,
                        ingredient_id: Ingredient.order(Arel.sql('RANDOM()')).first.id)
        dosemeal.meal = mealday
        puts "    🔸  Dose created" if dosemeal.save
      end
    end
  end
end



# Creating random Athletes without contracts

puts "\n👥 Creating Random Athletes"
5.times do
  athlete = User.new(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: false,
                  last_name: Faker::Name.last_name,
                  first_name: Faker::Name.first_name )
  puts "⚪️  Athlete created - #{athlete.first_name}" if athlete.save
end

# Done
puts "\n🌱 Seeding Completed 🌱"
puts "You have #{User.count} users."
puts "You have #{Contract.count} contracts."
puts "You have #{Program.count} programs."
puts "You have #{Ingredient.count} ingredient."
puts "You have #{Meal.count} meals."
puts "You have #{Dose.count} doses."


exercises = ["air squat", "alligator walk", "barbell thrusters", "bench press", "box jump", "burpees", "clean and jerk", "deadlift", "dips", "double under", "front squat", "handstand pushup", "hip raise", "hollow rock/hold", "kettlebell swing", "knees to elbows", "lunges", "muscle up", "overhead squat", "power clean" , "pistol squat", "pulls up", "push ups", "push press", "rose climb", "sumo deadlift", "squat", "shoulder press", "snatch", "wall ball"]
