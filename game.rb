class Game
  
  attr_reader :human, :sky_net

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
    @sky_net.add_money
    @human.take_away_money
    command_list
    #next
  end

  def you_won
    p "you won!"
    @human.add_money
    @sky_net.take_away_money
    command_list
    #next
  end


  def next_step
    p "Welcome to Blackjack!"
    cards = Deck.new.create_deck
    @sky_net = Player.new('sky_net')
    p 'your name?'
    @human   = Player.new(gets.chomp.to_s)

    @sky_net.cards << cards.pop << cards.pop # 2 times
    @human.cards   << cards.pop << cards.pop
    sky_net_sum = calc_sum(@sky_net.cards)
    human_sum   = calc_sum(@human.cards)

    p "sky_net_sum #{sky_net_sum}"
    p "#{human.name}_sum #{human_sum}"

    if human_sum == 21
      you_won
    end

    while human_sum < 21
      puts "What would you like to do? 1) hit 2) stay"
      hit_or_stay = gets.chomp

      if hit_or_stay == "2"
        break
      end

      #hit
      new_card = cards.pop
      puts "new card to #{human.name}: #{new_card}"
      @human.cards << new_card
      human_sum = calc_sum(@human.cards)
      puts "#{human.name} total sum is now: #{human_sum}"

      if human_sum == 21
        you_won
        
      elsif human_sum > 21
        sky_net_won
      end
    end

    # sky_net turn
    sky_net_won if sky_net_sum == 21

    while sky_net_sum < 21
      #hit
      new_card = cards.pop
      puts "new card for sky_net: #{new_card}"
      @sky_net.cards << new_card
      sky_net_sum = calc_sum(@sky_net.cards)
      puts "sky_net total sum is now: #{sky_net_sum}"

      if sky_net_sum == 21
        sky_net_won
        
      elsif sky_net_sum > 21
        you_won
        
      end
    end

    #compare
    puts "sky_net cards: "
    @sky_net.cards.each do |card|
      puts "=> #{card}"
    end

    puts "human cards: "
    @human.cards.each do |card|
      puts "=> #{card}"
    end
    
    if sky_net_sum > human_sum
      sky_net_won
    elsif sky_net_sum < human_sum
      you_won
    else
      puts "It's a tie!"
    end


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