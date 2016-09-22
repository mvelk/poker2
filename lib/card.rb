class Card
  attr_reader :face_value, :suit
  FACE_VALUES = {
    ace: "A",
    king: "K",
    queen: "Q",
    jack: "J",
    ten: "10",
    nine: "9",
    eight: "8",
    seven: "7",
    six: "6",
    five: "5",
    four: "4",
    three: "3",
    two: "2"
  }
  SUITS = {
    spades: "S",
    hearts: "H",
    diamonds: "D",
    clubs: "C"
  }

  def initialize(face_value, suit)
    @face_value = face_value
    @suit = suit
  end

  def to_s
    SUITS[@suit] + FACE_VALUES[@face_value]
  end

end
