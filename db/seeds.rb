# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
	email: "example@haileyskitchen.com",
	password: "foobar",
	password_confirmation: "foobar",
	first_name: "Example",
	last_name: "User"
	)

(1..100).each do |r|
  Recipe.create!(
  	name: "Lipsum Recipe #{r}", 
  	description: %{
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum. Vivamus viverra facilisis neque, in scelerisque urna pharetra vel. Donec a est mauris. Integer eget metus quis eros egestas elementum. Integer bibendum risus hendrerit dapibus tempor. Fusce placerat in orci vitae tincidunt. },
     serving: 4,
     source: "Internet Webpage",
     user_id: 1
    )
  
  (1..6).each do |i|
	Instruction.create!(
		content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis.",
		recipe_id: "#{r}"
		)
	end
end

