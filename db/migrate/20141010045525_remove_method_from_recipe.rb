class RemoveMethodFromRecipe < ActiveRecord::Migration

  def up
  	remove_column :recipes, :method
  end

  def down
  	add_column :recipes, :method, :string
  end
end
