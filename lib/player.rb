class Player
  attr_reader :folded, :name, :hand
  attr_accessor :stack

  def initialize(name, stack = 100, deck)
    @hand = Hand.new
    @name = name
    @stack = stack
    @folded = false
  end

  def assess_hand
    @hand.evaluate_hand
  end

  def show_hand
    @hand.display_hand
  end

end
