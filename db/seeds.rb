# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Contract.destroy_all


puts "5 coach"

5.times do
  User.create!(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: true,
                  last_name: Faker::Name.last_name ,
                  first_name: Faker::Name.first_name)
end

puts "10 coach"


10.times do
  User.create!(email: Faker::Internet.email,
                  password: "123456",
                  is_coach: false,
                  last_name: Faker::Name.last_name ,
                  first_name: Faker::Name.first_name )
end



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

