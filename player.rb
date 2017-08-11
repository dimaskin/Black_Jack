class Player
  attr_accessor :credit, :name

  def initialize(name)
    @credit = 100
  end

  def add_money
  	@credit += 10
  end
  
end