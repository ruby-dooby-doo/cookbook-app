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
    @recipe1.title = params[:input_title] || @recipe1.title
    @recipe1.chef = params[:input_chef] || @recipe1.chef
    @recipe1.ingredients = params[:input_ingredients] || @recipe1.ingredients
    @recipe1.prep_time = params[:input_prep_time] || @recipe1.prep_time
    @recipe1.directions = params[:input_directions] || @recipe1.directions
    @recipe1.image_url = params[:input_image_url] || @recipe1.image_url
    @recipe1.save

    # @recipe1.update(
    #   title: params[:input_title] || @recipe1.title,
    #   chef: params[:input_chef] || @recipe1.chef,
    #   ingredients: params[:input_ingredients] || @recipe1.ingredients,
    #   prep_time: params[:input_prep_time] || @recipe1.prep_time,
    #   directions: params[:input_directions] || @recipe1.directions,
    #   image_url: params[:input_image_url] || @recipe1.image_url
    # )
    render "show.json.jbuilder"
  end
end
