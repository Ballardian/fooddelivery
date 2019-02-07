require_relative '../models/meal.rb'
require 'pry-byebug'
require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @meals = []
    @next_id = 1
    @csv_file_path = csv_file_path
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @meals
  end

  def add(meal)
    @next_id = @meals.empty? ? @next_id : @meals.last.id + 1
    meal.id = @next_id
    @meals << meal
    update_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = {
        id: row[:id].to_i,
        name: row[:name],
        price: row[:price].to_i
      }
      @meals << Meal.new(attributes)
      # binding.pry
      # "lol"
    end
  end

  def find(id)
    @meals.each do |meal|
      return meal if meal.id == id
    end
  end

  def update_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
        # binding.pry
        # 'lol'
      end
    end
  end
end
