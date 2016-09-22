require_relative 'deck'
require_relative 'hand_type'

class Hand
  include HandType
  attr_reader :cards, :hand_type, :high_card, :kicker

  def initialize()
    @cards = []
    @hand_type = nil
    @high_card = nil
    @kicker = nil
  end

  def clear
    @cards = []
  end

  def beats_hand?(other_hand)
    return true if HAND_TYPE_RANKING[@hand_type] > HAND_TYPE_RANKING[other_hand.hand_type]
    return true if FACE_VALUES[@high_card.face_value] > FACE_VALUES[other_hand.high_card.face_value]
    return true if FACE_VALUES[@kicker.face_value] > FACE_VALUES[other_hand.kicker.face_value]
    false
  end

  def add_card(card)
    raise "Hand already has 5 cards" if @cards.length >= 5
    @cards << card
  end

  def cards=(cards)
    @cards = cards
  end

  def display_hand
    @cards.map(&:to_s).join(" ")
  end

  def evaluate_hand
    @hand_type = parse_hand_type
    @high_card, @kicker = find_highest_two
  end

  def find_highest_two
    @cards.sort_by { |card| FACE_VALUES[card.face_value] }.last(2)
  end

  def swap_card!(index, card)
    @cards[index] = card
  end

end
