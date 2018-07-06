class Recipe < ApplicationRecord
  def ingredients_list
    ingredients.split(", ")
  end
end
