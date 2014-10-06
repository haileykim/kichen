class Admins::RecipesController < ApplicationController

def index
	@recipes = Recipe.paginate(page: params[:page], per_page: 50)
end

def create
	
end

def edit
	@recipe = Recipe.find(params[:id])
end

def update
	@recipe = Recipe.find(params[:id])
	if @recipe.update(recipe_params)
		redirect_to admins_recipes_path
	else
		render :edit
	end
end

private

def recipe_params
		params.require(:recipe).permit(:name, :image, :method, :source, :tip, :serving, ingredients_attributes: [:id, :volume, :_destroy, food_item_attributes: [:id, :name, :_destroy]])
end

end