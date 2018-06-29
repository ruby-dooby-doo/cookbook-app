Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # index. shows all the recipes
    get '/recipes' => 'recipes#index'
    # show. displays one particular recipe
    get '/recipes/:id' => 'recipes#show'
    # create. make a new recipe in the db
    post '/recipes' => 'recipes#create'
    # update. change a recipe currently in the db
    patch '/recipes/:id' => 'recipes#update'
    # destroy. remove a recipe from the db
    delete '/recipes/:id' => 'recipes#destroy'
  end
end
