module HandType
  HAND_TYPE_RANKING = {
    royal_flush: 9,
    straight_flush: 8,
    four_of_a_kind: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    pair: 1,
    high_card: 0
  }
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

  def parse_hand_type
    return self.royal_flush if self.royal_flush
    return self.straight_flush if self.straight_flush
    return self.four_of_a_kind if self.four_of_a_kind
    return self.full_house if self.full_house
    return self.flush if self.flush
    return self.straight if self.straight
    return self.three_of_a_kind if self.three_of_a_kind
    return self.two_pair if self.two_pair
    return self.pair if self.pair
    :high_card
  end

  def royal_flush
    sorted_cards = @cards.sort_by { |card| FACE_VALUES[card.face_value] }
    sorted_cards.each_with_index do |card, idx|
      next if idx == sorted_cards.length - 1
      current_card_val = FACE_VALUES[card.face_value]
      next_card_val = FACE_VALUES[sorted_cards[idx + 1].face_value]
      return nil unless next_card_val - current_card_val == 1
    end
    suits = @cards.map(&:suit)
    return :royal_flush if suits.all? { |suit| suit == suits[0] } &&
                           sorted_cards.last.face_value == :ace
  end

  def straight_flush
    sorted_cards = @cards.sort_by { |card| FACE_VALUES[card.face_value] }
    sorted_cards.each_with_index do |card, idx|
      next if idx == sorted_cards.length - 1
      current_card_val = FACE_VALUES[card.face_value]
      next_card_val = FACE_VALUES[sorted_cards[idx + 1].face_value]
      return nil unless next_card_val - current_card_val == 1
    end
    suits = @cards.map(&:suit)
    return :straight_flush if suits.all? { |suit| suit == suits[0] } &&
                              sorted_cards.last.face_value != :ace
  end

  def four_of_a_kind
    count = 0
    face_values = @cards.map(&:face_value)
    face_values.uniq.each do |face_value|
      count += 1 if face_values.count(face_value) == 4
    end
    return :four_of_a_kind if count == 1
    nil
  end

  def full_house
    return :full_house unless self.three_of_a_kind.nil? || self.pair.nil?
  end

  def flush
    suits = @cards.map(&:suit)
    return :flush if suits.all? { |suit| suit == suits[0] } &&
                     self.straight.nil?
  end

  def straight
    sorted_cards = @cards.sort_by { |card| FACE_VALUES[card.face_value] }
    sorted_cards.each_with_index do |card, idx|
      next if idx == sorted_cards.length - 1
      current_card_val = FACE_VALUES[card.face_value]
      next_card_val = FACE_VALUES[sorted_cards[idx + 1].face_value]
      return nil unless next_card_val - current_card_val == 1
    end
    :straight
  end

  def three_of_a_kind
    count = 0
    face_values = @cards.map(&:face_value)
    face_values.uniq.each do |face_value|
      count += 1 if face_values.count(face_value) == 3
    end
    return :three_of_a_kind if count == 1 && self.pair.nil?
    nil
  end

  def two_pair
    count = 0
    face_values = @cards.map(&:face_value)
    face_values.uniq.each do |face_value|
      count += 1 if face_values.count(face_value) == 2
    end
    return :two_pair if count == 2
    nil
  end

  def pair
    count = 0
    face_values = @cards.map(&:face_value)
    face_values.uniq.each do |face_value|
      count += 1 if face_values.count(face_value) == 2
    end
    return :pair if count == 1
    nil
  end
end
