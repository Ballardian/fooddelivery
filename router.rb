# TODO: implement the router of your app.
require_relative '../models/order.rb'
require_relative '../models/meal.rb'
require_relative '../models/employee.rb'
require_relative '../models/customer.rb'
require_relative 'employee_repository.rb'
require_relative 'customer_repository.rb'
require_relative 'meal_repository.rb'
require_relative 'order_repository.rb'
require_relative '../controllers/customer_contoller.rb'
require_relative '../controllers/meals_contoller.rb'
require_relative '../controllers/order_contoller.rb'

require 'pry-byebug'
require 'csv'


class Router
  def initialize(customer_controller, meals_contoller, orders_controller)
    @customer_controller = customer_controller
    @meals_contoller = meals_contoller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "Welcome to the Orderbook!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @orders_controller.list
    when 2 then @meals_contoller.add
    when 3 then @orders_controller.list_undelivered_orders
    when 4 then @orders_controller.list_my_orders
    when 5 then @orders_controller.mark_as_delivered
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 6"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all orders"
    puts "2 - Add a meal"
    puts "3 - List all undelivered orders"
    puts "3 - List my orders"
    puts "5 - Mark an order as delivered"
    puts "6 - Exit"
  end
end
