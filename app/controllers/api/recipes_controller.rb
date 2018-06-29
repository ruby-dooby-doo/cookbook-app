class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def show
    # grab information from params to determine which recipe to show to the user
    recipe_id = params[:id]
    # grab a particular recipe from the db
    @recipe1 = Recipe.find_by(id: recipe_id)
    # show that recipe to the user
    render "show.json.jbuilder"
  end
end
