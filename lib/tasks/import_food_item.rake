require 'csv'

desc "Import FoodItem CSV data into its equivalent table"
task :import_food_item => [:environment] do
	
	file = "data/food_item.csv"

	CSV.foreach(file, headers: true, encoding: 'UTF-8') do |row|
		FoodItem.create(row.to_hash)
	end
end