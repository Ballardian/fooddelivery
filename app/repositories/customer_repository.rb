require_relative '../models/customer.rb'
require 'pry-byebug'
require 'csv'

class CustomerRepository
  def initialize(csv_file_path)
    @customers = []
    @next_id = 1
    @csv_file_path = csv_file_path
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @customers
  end

  def add(customer)
    @next_id = @customers.empty? ? @next_id : @customers.last.id + 1
    customer.id = @next_id
    @customers << customer
    update_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = {
        id: row[:id].to_i,
        name: row[:name],
        address: row[:address]
      }
      @customers << Customer.new(attributes)
      # binding.pry
      # "lol"
    end
  end

  def find(id)
    @customers.each do |customer|
      return customer if customer.id == id
    end
  end

  def update_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
        # binding.pry
        # 'lol'
      end
    end
  end
end
