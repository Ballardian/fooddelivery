class Employee
  attr_accessor :username, :password, :role, :id

  def initialize(attributes)
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
  end

  def manager?
    if @role == "manager"
      true
    else
      false
    end
  end

  def delivery_guy?
    if @role == "delivery_guy"
      true
    else
      false
    end
  end
end

