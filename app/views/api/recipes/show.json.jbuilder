json.id @recipe1.id
json.title @recipe1.title
json.directions @recipe1.directions
json.chef @recipe1.chef
json.ingredients @recipe1.ingredients
json.image_url @recipe1.image_url
json.prep_time @recipe1.prep_time
json.created_at @recipe1.created_at
json.updated_at @recipe1.updated_at

json.formatted do
  json.ingredients @recipe1.ingredients_list
  json.directions @recipe1.directions_list
end
