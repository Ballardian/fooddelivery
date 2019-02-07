require_relative '../repositories/customer_repository'
require_relative '../views/customer_view'
require 'pry-byebug'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomerView.new
  end

  def list
    @view.display_customers(@customer_repo.all)
  end

  def add
    # ask user for name
    name = @view.ask_for_customer_name
    # ask user for description
    address = @view.ask_for_address
    attributes = {
      id: 1,
      name: name,
      address: address
    }
    customer = Customer.new(attributes)
    @customer_repo.add(customer)
  end
end
