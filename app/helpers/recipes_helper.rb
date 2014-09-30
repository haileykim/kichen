module RecipesHelper
  def image_for(recipe)
  	if recipe.image.exists?
  		image_tag(recipe.image.url)
  	else
  		image_tag('placeholder.jpeg')
  	end
  end

  def tags_for(recipe)
  	raw recipe.tags.map(&:name).map { |t| link_to t, tag_path(t) }.join(' ')
  end
end
