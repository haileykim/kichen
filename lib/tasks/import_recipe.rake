require 'csv'

desc "Import Recipe CSV data into its equivalent table"
task :import_recipe => [:environment] do
	
	file = "data/recipe.csv"

	CSV.foreach(file, headers: true, encoding: 'UTF-8') do |row|
		Recipe.create(row.to_hash)
	end
end