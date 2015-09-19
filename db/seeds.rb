# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Raider.create!(name:'Steven', lastName:'Hawkins', rut:'162832999', acceptedTerms:true, birthdate: "01-01-1980", email: "example@example.com")
Raider.create!(name:'Mike', lastName:'Charlain', rut:'174043124', acceptedTerms:true, birthdate: "01-01-1980", email: "example@example.com")
Raider.create!(name:'Stiff', lastName:'Fitzer', rut:'60532494', acceptedTerms:true, birthdate: "01-01-1980", email: "example@example.com")
