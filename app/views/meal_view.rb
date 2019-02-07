class MealView
  def ask_for_meal_name
    puts "Name"
    gets.chomp
  end

  def ask_for_price
    puts "price"
    gets.chomp
  end

  # def ask_for_index
  #   puts "Give an index"
  #   gets.chomp.to_i
  # end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}: #{meal.price}"
    end
  end
end
