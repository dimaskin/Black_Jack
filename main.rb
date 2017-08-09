require 'gamer.rb'
require 'pack_of_cards.rb'
#require 'gamer.rb'
#require 'gamer.rb'


class Game

  def player_name
    p "your name?"
    gets.chomp.to_s
  end

  def begin_game
    player = Human.new (player_name)
    deck   = Deck.new
  end
end

game = Game.new
game.begin_game