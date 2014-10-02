class FavoritesController < ApplicationController
before_action :authenticate_user!

def create
	@recipe = Recipe.find(params[:recipe_id])
	@recipe.favorites.create!(user: current_user)
	redirect_to @recipe, notice: "Added to Favorites!"
end

def destroy
	@recipe = Recipe.find(params[:recipe_id])
	favorite = current_user.favorites.find(params[:id])
	favorite.destroy
	redirect_to @recipe, notice: "Removed from Favorites!"
end

end
