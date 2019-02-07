require_relative require_relative '../controllers/session_controller.rb'

class SessionView
  # ask user for username and password
  def initialize(session_controller)
    @session_controller = session_controller
  end
