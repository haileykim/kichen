class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tags = Tag.with_recipes_count
    @food_items = FoodItem.all
    @recipes = Recipe.where(nil).order('created_at desc').paginate(page: params[:page], per_page: 18)
    @recipes = @recipes.search(params[:search]) if params[:search]
    @recipes = @recipes.tagged_with(params[:tag]) if params[:tag]
    @recipes = @recipes.with_ingredient(params[:ingredient]) if params[:ingredient]
  end

  def show
    @recipe = Recipe.includes(:user, :ingredients, :food_items, :comments, :favorites, :fans).find(params[:id])
    @comment = @recipe.comments.new

  
   # Because @recipe already includes its associated entities, no more need the followings. 
   # @comments = @recipe.comments
   # @fans = @recipe.fans

    if current_user
      @current_favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    end
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredients.build }
    4.times { @recipe.instructions.build }
  end

  def edit
    if @recipe.ingredients.empty?
      3.times { @recipe.ingredients.build }
    end

    if @recipe.instructions.empty?
      4.times { @recipe.instructions.build }
    end
    # Event tracking
    track_event "Editing recipe"
  end


  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
      # Event tracking
      track_event "Recipe created"
    else
      render :new
    end

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :serving, :user, :source, :description, :image, 
        :tag_tokens,
        instructions_attributes: [:id, :content, :_destroy],
        ingredients_attributes: [:id, :food_item_name, :volume, :_destroy])
    end
end
