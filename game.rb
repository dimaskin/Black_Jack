class Game
  
  def calc_sum(cards)
    p cards
  end


  def next_step
    p "Welcome to Blackjack!"
    cards = Deck.new.create_deck
    calc_sum(cards)
  end

  def command_list
    p '1. New game'
    p '2. Good bay'
  end

  def begin_game
    command_list
    loop do
      answer = gets.chomp.to_i
      if answer == 1 
        next_step
      elsif answer == 2 
        break
      else
        p '1 or 2'
      end
    end # loop
  end
end