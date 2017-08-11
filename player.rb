class Player
  attr_accessor :credit, :name, :cards

  def initialize(name)
    @credit = 100
    @cards  = []
  end

  def add_money
  	@credit += 10
  end

end