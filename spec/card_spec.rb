require 'rspec'
require 'card'

describe Card do
  before { @card = Card.new(:ace, :spades) }
  describe "#initialize" do
    it "should have a face value" do
      expect(@card.face_value).to eq(:ace)
    end
    it "should have a suit" do
      expect(@card.suit).to eq(:spades)
    end
  end
end
