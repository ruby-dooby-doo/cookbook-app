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

  def create
    # make a new recipe in the db
    @recipe1 = Recipe.new(
      title: "eggs",
      chef: "brian",
      directions: "put the eggs on a hot pan",
      prep_time: 15,
      ingredients: "eggs, onions, peppers, tomato",
      image_url: ""
    )
    @recipe1.save
    render "show.json.jbuilder"
  end
end
