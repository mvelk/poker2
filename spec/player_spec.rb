require 'rspec'
require 'player'

describe Player do

  describe "#initialize" do
    it "has a hand"
    it "has a name"
    it "has a stack (and not a pot)"
    it "has a 'folded' tracker"
  end

  describe "#get_move" do
    it "handles folding"
    it "handles checking"
    it "handles betting"
    it "handles calling"
  end

  describe "#get_bet" do
    it "returns an amount to put in pot"
    it "raises an error if input is not a number"
    it "raises an error if amount chosen is greater than player's stack"
  end

end
