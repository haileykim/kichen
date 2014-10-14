class StaticPagesController < ApplicationController
  def home
  	@recipes = Recipe.limit(6).order("created_at desc").all
  	if current_user
      redirect_to recipes_path
    end
  end
end
