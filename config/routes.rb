Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/one_recipe_url" => "api/recipes#one_recipe_action"
end
