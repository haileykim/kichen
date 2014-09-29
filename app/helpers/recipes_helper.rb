module RecipesHelper
  def image_for(recipe)
  	if recipe.image.exists?
  		image_tag(recipe.image.url)
  	else
  		image_tag('placeholder.jpeg')
  	end
  end
end
