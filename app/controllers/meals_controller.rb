require_relative '../repositories/meal_repository'
require_relative '../views/meal_view'
require 'pry-byebug'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealView.new
  end

  def list
    @view.display_meals(@meal_repo.all)
  end

  def add
    # ask user for name
    name = @view.ask_for_meal_name
    # ask user for description
    price = @view.ask_for_price
    attributes = {
      id: 1,
      name: name,
      price: price.to_i
    }
    meal = Meal.new(attributes)
    @meal_repo.add(meal)
  end
end
