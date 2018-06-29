require 'unirest'

response = Unirest.post("localhost:3000/api/recipes",
  parameters: {
    input_title: "salad",
    input_chef: "alice waters",
    input_directions: "put the tomatoes on the lettuce",
    input_prep_time: 12,
    input_ingredients: "lettuce, tomatoes, croutons, dressing",
    input_image_url: ""
  }
)
p response.body
