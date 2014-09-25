class FoodItemsController < ApplicationController
  def index
  	@food_items = FoodItem.order(:name).where("name like ?", "%#{params[:term]}%")
  	render json: @food_items.map(&:name)
  end
end
