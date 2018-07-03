require 'unirest'



# create action
# response = Unirest.post("localhost:3000/api/recipes",
#   parameters: {
#     input_title: "salad",
#     input_chef: "alice waters",
#     input_directions: "put the tomatoes on the lettuce",
#     input_prep_time: 12,
#     input_ingredients: "lettuce, tomatoes, croutons, dressing",
#     input_image_url: ""
#   }
# )
# p response.body


# update action
# p "which item would you like to update?"
# recipe_id = gets.chomp


response = Unirest.patch("localhost:3000/api/recipes/#{recipe_id}",
  parameters: {
    input_title: "new title"
  }
)

# p response.body

# destroy
response = Unirest.delete("localhost:3000/api/recipes/5")

p response.body
