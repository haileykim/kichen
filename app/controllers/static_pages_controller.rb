class StaticPagesController < ApplicationController
  def home
  	@recipes = Recipe.limit(3)
  	if current_user
      redirect_to recipes_path
    end
  end
end
