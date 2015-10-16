# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unsealable_offenses = [ "Firearm Dealer's License, Improper Issue", "Unlicensed Sale of Ammunition",
  "Firearm Violation Sale", "Failure to Report Unlicensed Fireman", "False Statement on Firearm Application",
  "False Statement on Firearm ID Card Application", "Firearm Sale to Minor", "Firearm Violation License"
]

unsealable_offenses.each do | offense|
  UnsealableCrime.create!(offense_name: offense)
end
