Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # index. shows all the recipes
    get '/recipes' => 'recipes#index'
    # show. displays one particular recipe
    get '/recipes/:id' => 'recipes#show'
  end
end
