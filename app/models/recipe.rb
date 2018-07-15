class Recipe < ApplicationRecord
  belongs_to :user
  def ingredients_list
    ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def month_day_year
    created_at.strftime("%B %e, %Y")
  end

  def hours_and_minutes
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    if hours > 0
      result += "#{hours} hours "
    end
    if minutes > 0
      result += "#{minutes} minutes"
    end
    result
  end
end
