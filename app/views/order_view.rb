class OrderView
  def ask_for_customer_id
    puts "customer id"
    gets.chomp.to_i
  end

  def ask_for_employee_id
    puts "employee id"
    gets.chomp.to_i
  end

  def ask_for_meal_id
    puts "meal id"
    gets.chomp.to_i
  end

  def display_undelivered_orders(undelivered)
    undelivered.each do |order|
      puts "#{order.meal.name}: #{order.employee.username},#{order.customer.name} #{order.customer.address}"
    end
  end

  def show_employee_undelivered(undelivered)
    undelivered.each do |order|
      puts "#{order.customer.name} #{order.meal.name}"
    end
  end

  def ask_employee_for_order_id
    puts "order_id"
    gets.chomp.to_i
  end
end
