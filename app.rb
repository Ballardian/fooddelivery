# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository' # You need to create this file!
# require_relative 'controller' # You need to create this file!
# require_relative 'router'
require 'pry-byebug'
require_relative 'app/models/meal'

# csv_file = File.join(__dir__, 'app/repositories/meals.csv')
# meal_repo  = MealRepository.new(csv_file)
# attributes_one = {
#   id: 11,
#   name: "beans",
#   price: 2
# }
# attributes_two = {
#   id: 2,
#   name: "cheese",
#   price: 3
# }
# beans = Meal.new(attributes_one)
# cheese = Meal.new(attributes_two)
# meal_repo.add(beans)
# meal_repo.add(cheese)
# # controller = Controller.new(cookbook)

# # router = Router.new(controller)

# # # Start the app
# # router.run
