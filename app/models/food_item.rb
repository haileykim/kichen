class FoodItem < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients

 
end
