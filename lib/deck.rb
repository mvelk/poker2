require_relative 'card'

class Deck
  FACE_VALUES = {
    ace: 13,
    king: 12,
    queen: 11,
    jack: 10,
    ten: 9,
    nine: 8,
    eight: 7,
    seven: 6,
    six: 5,
    five: 4,
    four: 3,
    three: 2,
    two: 1
  }
  SUITS = [
    :spades,
    :hearts,
    :diamonds,
    :clubs
  ]

  attr_reader :cards

  def self.make_deck
    cards = []
    face_values = FACE_VALUES.keys
    SUITS.each do |suit|
      face_values.each do |face_value|
        cards << Card.new(face_value, suit)
      end
    end
    Deck.new(cards)
  end

  def initialize(cards)
    @cards = cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal_card!
    raise "Deck is empty" if @cards.empty?
    @cards.pop
  end

end
