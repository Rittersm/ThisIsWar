require './card.rb'
require './deck.rb'
require './player.rb'

class Card

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    @face = face
    @suit = suit
    face_value
  end

  def face_value
    if face == "J"
      self.value = 11
    elsif face == "Q"
      self.value = 12
    elsif face == "K"
      self.value = 13
    elsif face == "A"
      self.value = 14
    else
      self.value = face.to_i
    end
  end

  def to_s
    "#{face} of #{suit}"
  end

end

class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    create_deck
  end

  def create_deck
    face_name = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    suit_name = %w(Hearts Diamonds Clubs Spades)
    suit_name.each do |x|
      face_name.each do |y|
        self.deck << Card.new( y, x)
      end
    end
  end

end

class Player

    attr_accessor :new_deck

    def initialize
      @new_deck = Deck.new
      deck_shuffle
    end

    def deck_shuffle
      new_deck.deck.shuffle!
    end

    def deck
      new_deck.deck
    end

    def draw
      deck.shift
    end

end

class Game

  attr_accessor :player, :computer, :player_card, :computer_card, :player_wins, :computer_wins

  def initialize
    @player = Player.new
    @computer =  Player.new
    @computer_wins = []
    @computer_wins = []
  end

  def intro
    puts "Let's play WAR. We each draw a card from our deck, high card wins."
    puts "Ready to play?"
    gets
  end

  def play
    intro
    until player.deck.length == 0
      self.computer_card = computer.draw
      puts "I drew a #{computer_card.value}"
      self.player_card = player.draw
      puts "You drew a #{player_card.value}"
      determine_high_card
    end
    while player.deck.length == 0
      determine_winner
      rematch
    end
  end

  def determine_high_card
    draw_cards = []
    if computer_card.value > player_card.value
      computer_wins << player_card && computer_card
      puts "I win! My #{computer_card} beats your #{player_card}"
    elsif player_card.value > computer_card.value
      player_wins << player_card && computer_card
      puts "You win! Your #{player_card} beats my #{computer_card}"
    else
      draw_cards << player_card && computer_card
      puts "It's a draw!"
    end
  end

  def determine_winner
    if computer_wins.length > player_wins.length
      puts "I am victorious #{computer_wins.length} to #{player_wins.length}!"
    elsif player_wins.length > computer_wins.length
      puts "You have bested me #{player_wins.length} to #{computer_wins.length}!"
    end
  end

  def rematch
    puts "WAR once more?"
    resp = gets.chomp&.downcase[0]
    if resp == "y"
      Game.new.play
    else
      puts "Peace!"
      exit
    end
  end
end

Game.new.play
