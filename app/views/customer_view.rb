class CustomerView
  def ask_for_customer_name
    puts "Name"
    gets.chomp
  end

  def ask_for_address
    puts "address"
    gets.chomp
  end

  # def ask_for_index
  #   puts "Give an index"
  #   gets.chomp.to_i
  # end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}: #{customer.address}"
    end
  end
end
