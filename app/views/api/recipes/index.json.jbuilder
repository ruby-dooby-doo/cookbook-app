json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.directions recipe.directions_list
  json.chef recipe.chef
  json.ingredients recipe.ingredients_list
  json.image_url recipe.image_url
  json.prep_time recipe.prep_time
  json.created_at recipe.created_at
  json.updated_at recipe.updated_at
end
