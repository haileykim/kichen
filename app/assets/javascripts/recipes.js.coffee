# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#recipe_ingredients_attributes_0_food_name').autocomplete
    source: $('#recipe_ingredients_attributes_0_food_name').data('autocomplete-source')

jQuery ->
  $('#recipe_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook'
    prePopulate: $('#recipe_tag_tokens').data('load')