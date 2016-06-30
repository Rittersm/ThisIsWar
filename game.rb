require './card.rb'
require './deck.rb'
require './player.rb'

class Game

  attr_accessor :player, :computer, :player_card, :computer_card, :player_wins, :computer_wins

  def initialize
    @player = Player.new
    @computer =  Player.new
    @player_wins = []
    @computer_wins = []
  end

  def intro
    puts "Let's play WAR. We each draw a card from our deck, high card wins."
    puts "Ready to play?"
    gets
  end

  def play(say_intro=true)
    intro if say_intro
    until player.deck.length == 0
      self.computer_card = computer.draw
      puts "I drew the #{computer_card}"
      self.player_card = player.draw
      puts "You drew the #{player_card}"
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
      computer_wins << player_card
      computer_wins << computer_card
      puts "I win! My #{computer_card} beats your #{player_card}"
    elsif player_card.value > computer_card.value
      player_wins << player_card
      player_wins << computer_card
      puts "You win! Your #{player_card} beats my #{computer_card}"
    else
      draw_cards << player_card
      draw_cards << computer_card
      puts "It's a draw!"
    end
  end

  def determine_winner
    if computer_wins.length > player_wins.length
      puts "I am victorious #{computer_wins.length} to #{player_wins.length}!"
    elsif player_wins.length > computer_wins.length
      puts "You have bested me #{player_wins.length} to #{computer_wins.length}!"
    else
      puts "We have come to a stalemate, we must play again"
      Game.new.play(false)
    end
  end

  def rematch
    puts "WAR once more?"
    resp = gets.chomp&.downcase[0]
    if resp == "y"
      Game.new.play(false)
    else
      puts "Peace!"
      exit
    end
  end
end

Game.new.play
