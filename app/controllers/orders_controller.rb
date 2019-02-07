require_relative '../repositories/customer_repository'
require_relative '../repositories/meal_repository'
require_relative '../repositories/employee_repository'
require_relative '../repositories/order_repository'
require_relative '../views/order_view'
require 'pry-byebug'

class OrdersController
  attr_accessor :order_repository, :meal_repository, :employee_repository, :customer_repository
  def initialize(meal_repo, employee_repo, customer_repo, order_repo)
    @order_repository = order_repo
    @meal_repository = meal_repo
    @employee_repository = employee_repo
    @customer_repository = customer_repo
    @view = OrderView.new
  end

  def list_undelivered_orders
    undelivered = @order_repository.undelivered_orders
    @view.display_undelivered_orders(undelivered)
  end

  def add
    customer_id = @view.ask_for_customer_id
    employee_id = @view.ask_for_employee_id
    meal_id = @view.ask_for_meal_id
    employee = @employee_repository.find(employee_id)
    customer = @customer_repository.find(customer_id)
    meal = @meal_repository.find(meal_id)
    attributes = {
      id: 1,
      employee: employee,
      customer: customer,
      meal: meal,
      delivered: false
    }
    order = Order.new(attributes)
    # binding.pry
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    undelivered = @order_repository.undelivered_orders.select do |order|
      order.employee == employee
    end
    @view.show_employee_undelivered(undelivered)
  end

  def mark_as_delivered(employee)
    order = @view.ask_employee_for_order_id
    delivered_order = @order_repository.find(order)
    delivered_order.deliver!
    @order_repository.update_csv
    # binding.pry
    # 'l'
  end
end
