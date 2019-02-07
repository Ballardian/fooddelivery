require_relative '../repositories/employee_repository'

class SessionController
  # ask user for username and password
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def sign_in
    # TODO view methods
    employee_username = @view.ask_for_username
    employee_password = @view.ask_for_password
    current_employee = @employee_repository.find_by_username(employee_username)
    try_again = true
    while try_again
      if (current_employee.password == employee_password)
        @view.welcome(current_employee)
        exit
      else
        @view.try_again
      end
    end
  end
end
