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
      title: params[:input_title],
      chef: params[:input_chef],
      directions: params[:input_directions],
      prep_time: params[:input_prep_time],
      ingredients: params[:input_ingredients],
      image_url: params[:input_image_url]
    )
    @recipe1.save
    render "show.json.jbuilder"
  end

  def update
    # get a recipe from the db --- show
    recipe_id = params[:id]
    # grab a particular recipe from the db
    @recipe1 = Recipe.find_by(id: recipe_id)
    # modify that recipe --- create
    @recipe1.title = "eggs benedict"
    @recipe1.chef = "Benedict arnold"
    @recipe1.ingredients = "eggs, bacon, cheese, hollandaise, english muffin"
    @recipe1.prep_time = 60
    @recipe1.directions = "put the hollan on the daise and toast the english muffin"
    @recipe1.image_url = ""
    @recipe1.save
    render "show.json.jbuilder"
  end
end
