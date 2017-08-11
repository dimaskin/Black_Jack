class Deck
  CLUBS  = "\u2663".encode('utf-8') #трефы
  DIAMS  = "\u2666".encode('utf-8') #бубны
  HEARTS = "\u2661".encode('utf-8') #червы
  SPADES = "\u2664".encode('utf-8') #пики

  SUITS = [ CLUBS, DIAMS, HEARTS, SPADES ]
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def create_deck
    deck = CARDS.product(SUITS)
    deck.shuffle!
  end

end