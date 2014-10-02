class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe

  def saved_to_favorites?(recipe)
  	favorites.find_by(recipe_id: recipe.id)
  end

  def save_to_favorites!(recipe)
  	favorites.create!(recipe_id: recipe.id)
  end

  def remove_from_favorites!(recipe)
  	favorites.find_by(recipe_id: recipe.id).destroy
  end

end
