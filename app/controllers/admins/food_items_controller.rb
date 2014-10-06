class Admins::FoodItemsController < ApplicationController

def index
	@food_items = FoodItem.paginate(page: params[:page], per_page: 50)
end

def create
	
end

def edit
	@food_item = FoodItem.find(params[:id])
end

def update
	@food_item = FoodItem.find(params[:id])
	if @food_item.update(food_item_params)
		redirect_to admins_food_items_path
	else
		render :edit
	end
end

private

def food_item_params
		params.require(:food_item).permit(:name)
end

end