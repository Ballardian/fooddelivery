require_relative '../models/order.rb'
require_relative 'employee_repository.rb'
require_relative 'customer_repository.rb'
require_relative 'meal_repository.rb'
require 'pry-byebug'
require 'csv'

class OrderRepository
  attr_accessor :meal_repository, :employee_repository, :customer_repository
  def initialize(csv_file_path, meal_repo, employee_repo, customer_repo)
    @orders = []
    @meal_repository = meal_repo
    @employee_repository = employee_repo
    @customer_repository = customer_repo
    @next_id = 1
    @csv_file_path = csv_file_path
    load_csv if File.exist?(@csv_file_path)
    # binding.pry
  end

  def undelivered_orders
    undelivered = []
    @orders.each do |order|
      undelivered << order unless order.delivered?
    end
    undelivered
    # binding.pry
  end

  def add(order)
    @next_id = @orders.empty? ? @next_id : @orders.last.id + 1
    order.id = @next_id
    @orders << order
    update_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      meal_id = row[:meal_id].to_i
      meal =  @meal_repository.find(meal_id)
      employee_id = row[:employee_id].to_i
      employee = @employee_repository.find(employee_id)
      customer_id = row[:customer_id].to_i
      customer = @customer_repository.find(customer_id)
      order_id = row[:id].to_i
      delivered = row[:delivered] == "true"
      order = Order.new(meal: meal, customer: customer, employee: employee, id: order_id, delivered: delivered)
      @orders << order
      # binding.pry
    end
  end

  def find(id)
    @orders.each do |customer|
      return customer if customer.id == id
    end
  end

  def update_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "delivered", "meal_id", "employee_id", "customer_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
        # binding.pry
        # 'lol'
      end
    end
  end
end
