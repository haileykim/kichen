class IngredientsController < ApplicationController
  autocomplete :food_item, :name, full: true
end
