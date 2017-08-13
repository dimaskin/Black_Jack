class Player
  attr_accessor :credit, :name, :cards

  def initialize(name)
    @credit = 100
    @cards  = []
    @name = name
  end

  def add_money
  	@credit += 10
  end

  def take_away_money
  	@credit -= 10
  end

end