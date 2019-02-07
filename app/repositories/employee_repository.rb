require_relative '../models/employee.rb'
require 'pry-byebug'
require 'csv'

class EmployeeRepository
  def initialize(csv_file_path)
    @employees = []
    @next_id = 1
    @csv_file_path = csv_file_path
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @employees
  end

  def all_delivery_guys
    delivery_guys = []
    @employees.each do |employee|
      delivery_guys << employee if employee.delivery_guy?
    end
    delivery_guys
    # binding.pry
    # 'lol'
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      attributes = {
        id: row[:id].to_i,
        username: row[:username],
        password: row[:password],
        role: row[:role]
      }
      @employees << Employee.new(attributes)
      # binding.pry
      # "lol"
    end
  end

  def find(id)
    @employees.each do |employee|
      return employee if employee.id == id
    end
  end

  def find_by_username(username)
    @employees.each do |employee|
      return employee if employee.username == username
    end
  end

  def update_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "username", "password" "role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
        # binding.pry
        # 'lol'
      end
    end
  end
end
