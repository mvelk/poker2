require 'rspec'
require 'poker'

describe Poker do

  describe "#initialize" do
    it "holds a deck"
    it "keeps track of which player requires action"
    it "keeps track of who the dealer is"
    it "keeps track of amount in pot"
  end

  describe "#add_to_pot" do
    it "adds a player's bet to the pot"
  end

  describe "#give_winnings" do
    it "adds winnings to player's stack"
  end

end
