class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @recipes = @user.recipes
  @favorites = @user.favorite_recipes
  end

end
