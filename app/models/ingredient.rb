class Ingredient < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :recipe
  accepts_nested_attributes_for :food_item
end
