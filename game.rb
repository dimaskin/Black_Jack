class Game
  
  def calc_sum(cards)
    val_arr = cards.map{|e| e[0] }
    total = 0
    val_arr.each do |value|
      if value == "A"
        total += 11
      elsif value.to_i == 0 #J, Q, K
          total += 10
      else
          total += value.to_i
      end
    end
    total
  end

  def sky_net_won
    p "sky net won!"
    command_list
    #exit
  end

  def you_won
    p "you won!"
    command_list
    #exit
  end


  def next_step
    p "Welcome to Blackjack!"
    cards = Deck.new.create_deck
    sky_net = Player.new('sky_net')
    p 'your name?'
    human   = Player.new(gets.chomp.to_s)

    sky_net.cards << cards.pop << cards.pop # 2 times
    human.cards   << cards.pop << cards.pop
    sky_net_sum = calc_sum(sky_net.cards)
    human_sum   = calc_sum(human.cards)

    p "sky_net_sum #{sky_net_sum}"
    p "human_sum #{human_sum}"


    sky_net_won if sky_net_sum == 21
    you_won     if human_sum   == 21
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
        p 'bay'
        break
      else
        p '1 or 2'
      end
    end # loop
  end
end