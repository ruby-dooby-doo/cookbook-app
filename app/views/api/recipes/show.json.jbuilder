json.id @recipe1.id
json.title @recipe1.title
json.directions @recipe1.directions
json.ingredients @recipe1.ingredients
json.image_url @recipe1.image_url
json.prep_time @recipe1.prep_time
json.created_at @recipe1.created_at
json.updated_at @recipe1.updated_at

json.formatted do
  json.ingredients @recipe1.ingredients_list
  json.directions @recipe1.directions_list
  json.created_at @recipe1.month_day_year
  json.hours_and_minutes @recipe1.hours_and_minutes
end
json.user @recipe1.user
