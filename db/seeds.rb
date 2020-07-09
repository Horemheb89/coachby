
# Destroying previous instances
Dose.destroy_all
User.destroy_all
Contract.destroy_all
Ingredient.destroy_all
Meal.destroy_all
Dose.destroy_all
Program.destroy_all


# Seeding Starts
puts "\n🌱 Seeding Starts 🌱"

require 'roo'
require 'roo-xls'

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

weight = [55,80,90,100,70,80]
height = [180,155,160,170,170,175]

  rand(2..5).times do
    athlete = User.new(email: Faker::Internet.email,
                    password: "123456",
                    is_coach: false,
                    last_name: Faker::Name.last_name,
                    first_name: Faker::Name.first_name,
                    weight: weight.sample,
                    height: height.sample,
                    dob: Faker::Date.between(from: '1960-09-23', to: '2000-09-25'))
    print " ◽️  Athlete created - #{athlete.first_name}. " if athlete.save

    # Creating Contracts for each Coach

    contract = Contract.new(coach_id: coach.id, athlete_id:athlete.id)
    puts "Contract created (#{athlete.first_name} and #{coach.first_name})." if contract.save

    program = Program.new(proteins_target: 320, fats_target: 200, carbs_target: 300, contract_id: contract.id)
    puts "\n🗣 program is created successfully with #{athlete.first_name} and #{coach.first_name}" if program.save

    name_meals = ["petit-dejeuner" ,"dejeuner" ,"gouter" ,"diner"]

    d = Date.today
    30.times do
      d += 1
      name_meals.each do |name_meal|
        mealday = Meal.new(name: name_meal,
                        start_time: (d))
        mealday.program = program
        puts "\n🗣 meal is created successfully the the date is #{d}" if mealday.save
        puts "meal is #{name_meal}"

        quantity = [50,100,150,200]

        4.times do
          rand_id = rand(Ingredient.count)
          dosemeal = Dose.create(quantity: quantity.sample ,
                          ingredient_id: Ingredient.order(Arel.sql('RANDOM()')).first.id)
          dosemeal.meal = mealday
          puts "\n🗣 dose is created successfully" if dosemeal.save
        end
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
  puts " ◽️  Athlete Created - #{athlete.first_name}" if athlete.save
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
