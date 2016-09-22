require 'rspec'
require 'deck'

describe Deck do
  before(:each) { @deck = Deck.make_deck }
  describe "#initialize" do
    it "creates a deck array of length 52" do
      expect(@deck.cards.length).to eq(52)
    end
  end
  describe "::make_deck" do
    it "creates an array of 52 card objects" do
      expect(@deck.cards.all? { |card| card.is_a?(Card) }).to be_truthy
    end
    it "should not have duplicate cards" do
      expect(@deck.cards).to eq(@deck.cards.uniq)
    end
    it "should include 13 cards of each suit" do
      expect(@deck.cards.select { |card| card.suit == :spades }.length).to eq(13)
    end
  end
  describe "#shuffle!" do
    it "should shuffle order of array of cards" do
      suits = @deck.cards.map(&:suit).dup
      @deck.shuffle!
      expect(@deck.cards.map(&:suit)).to_not eq(suits)
    end
  end
  describe "#deal_card!" do
    subject(:empty_deck) { Deck.new([]) }
    it "should remove top card from deck" do
      last_card = @deck.cards.last
      @deck.deal_card!
      expect(last_card).to_not eq(@deck.cards.last)
    end
    it "should raise error if deck empty" do
      expect{empty_deck.deal_card!}.to raise_error(StandardError)
    end
  end
end
