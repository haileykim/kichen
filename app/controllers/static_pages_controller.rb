class StaticPagesController < ApplicationController
  def home
  	@recipes = Recipe.limit(3).order("created_at DESC").all
  	if current_user
      redirect_to recipes_path
    end
  end
end
