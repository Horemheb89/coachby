
require 'roo'
require 'roo-xls'


# Seeding Starts
puts "\n🌱 Seeding Starts 🌱"



# Destroying previous instances
puts "\n🗑  Destroying Exercise instances."
Exercise.destroy_all
puts "Success!"

puts "\n🗑  Destroying Training instances."
Training.destroy_all
puts "Success!"

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
  # tab = tab.sample(500) so I can pick specific ingredient
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
photo_ids = ['zmzkge9yolvqgzkaynuf', 'f9bhlz9gzoxswphjn8an', 'roehhmchrnmn5qe7rrrx', 'cxbugbjk8ukzaaelpx7q']
count = 0

4.times do
  athlete = User.new(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: false,
                  last_name: Faker::Name.last_name,
                  first_name: Faker::Name.first_name,
                  weight: weight.sample,
                  height: height.sample,
                  dob: Faker::Date.between(from: '1960-09-23', to: '2000-09-25'),
                  profile_photo: photo_ids[count])
  print "\n⚪️  Athlete created - #{athlete.first_name}. " if athlete.save

  # Seeding Contracts for each Coach
  contract = Contract.new(coach_id: coach.id, athlete_id: athlete.id)
  print "Contract created (#{athlete.first_name} and #{coach.first_name})." if contract.save


  program1 = Program.new(proteins_target: 160,
    fats_target: 60,
    carbs_target: 300,
    contract_id: contract.id)
  puts "Program1 created." if program1.save


   # on cree un 2er program
  program2 = Program.new(proteins_target: 180,
    fats_target: 80,
    carbs_target: 320,
    contract_id: contract.id)
  puts "Program2 created." if program2.save





  # Seeding Meals
  name_meals = ["petit-dejeuner" ,"dejeuner" ,"gouter" ,"diner"]
  d = Date.today - 60

  30.times do
    d += 1
      mealday = Meal.new(name: "petit-dejeuner",
                      start_time: (d))
      mealday.program = program1
      puts "\n    ⚪️  Meal created - #{"petit-dejeuner".capitalize} (#{d}) for program1" if mealday.save

      poulet = Ingredient.where(name:"Poulet, poitrine, viande et peau, cru")

      random = [20,-20,2,5,-10,10]

      dosemeat = Dose.create(quantity: 800 + rand(-10..10) ,
                      ingredient_id: poulet.ids.sample)
      dosemeat.meal = mealday
      puts "    🔸  Dose created" if dosemeat.save

      sugar = Ingredient.where(name:"Sucre vanillé")

      sugardose = Dose.create(quantity: 310 + rand(-25..20) ,
                      ingredient_id: sugar.ids.sample)
      sugardose.meal = mealday
      puts "    🔸  Dose created" if sugardose.save
    end

  # Seeding Meals du program 2
  d = Date.today - 29

  30.times do
    d += 1
      mealday = Meal.new(name: "petit-dejeuner",
                      start_time: (d))
      mealday.program = program2
      puts "\n    ⚪️  Meal created - #{"petit-dejeuner".capitalize} (#{d}) for program2" if mealday.save

      poulet = Ingredient.where(name:"Poulet, poitrine, viande et peau, cru")

      random = [20,-20,2,5,-10,10]

      dosemeat = Dose.create(quantity: 880 + rand(-15..25) ,
                      ingredient_id: poulet.ids.sample)
      dosemeat.meal = mealday
      puts "    🔸  Dose created" if dosemeat.save

      sugar = Ingredient.where(name:"Sucre vanillé")

      sugardose = Dose.create(quantity: 330 + rand(-10..15) ,
                      ingredient_id: sugar.ids.sample)
      sugardose.meal = mealday
      puts "    🔸  Dose created" if sugardose.save


      fat = Ingredient.where(name:"Huile végétale (aliment moyen)")

      fatdose = Dose.create(quantity: 10 + rand(-5..3) ,
                            ingredient_id: fat.ids.sample)

      fatdose.meal = mealday
      puts "    🔸  Dose created" if fatdose.save

  end
  count +=1 # to change athlete picture
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
