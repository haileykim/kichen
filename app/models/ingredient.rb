class Ingredient < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :recipe

  def food_name
  	food_item.try(:name)
  end

  def food_name=(name)
  	self.food_item = FoodItem.find_or_create_by(name: name) if name.present?
  end

  
end
