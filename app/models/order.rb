class Order
  attr_accessor :meal, :employee, :customer, :delivered, :id

  def initialize(attributes)
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @id = attributes[:id]
    @delivered = attributes[:delivered]
  end

  def delivered?
    @delivered == true ? true : false
  end

  def deliver!
    @delivered = true
  end
end
