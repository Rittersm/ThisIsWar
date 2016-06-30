class Player

    attr_accessor :my_deck

    def initialize
      @my_deck = Deck.new
      deck_shuffle
    end

    def deck_shuffle
      my_deck.deck.shuffle!
    end

    def deck
      my_deck.deck
    end

    def draw
      deck.shift
    end

end
