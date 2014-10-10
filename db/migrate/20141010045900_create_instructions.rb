class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :content
      t.integer :recipe_id

      t.timestamps
    end
  end
end
