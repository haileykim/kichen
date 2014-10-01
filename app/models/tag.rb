class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :recipes, through: :taggings

  def self.with_recipes_count
  	joins(:recipes).select("tags.*, COUNT(recipes.id) AS recipes_count").group("tags.id")
  end
end
