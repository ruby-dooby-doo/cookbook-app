json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.directions recipe.directions
  json.ingredients recipe.ingredients
  json.image_url recipe.image_url
  json.prep_time recipe.prep_time
  json.created_at recipe.created_at
  json.updated_at recipe.updated_at

  json.formatted do
    json.ingredients recipe.ingredients_list
    json.directions recipe.directions_list
  end
  json.user recipe.user
end
