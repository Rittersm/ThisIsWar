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

    attr_accessor :my_deck

    def initialize
      shuffle
    end

    def shuffle
      Deck.new.shuffle!
    end

end

puts Player.new.inspect

class Game

end

# Game.new.play
