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
