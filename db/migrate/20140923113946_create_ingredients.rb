class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe
      t.references :food_item
      t.string :volume

      t.timestamps
    end
  end
end
