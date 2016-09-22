require 'rspec'
require 'hand'


#kicker
#type of hand
#high card parser


describe Hand do
  before(:each){@hand = Hand.new(Deck.make_deck)}
  describe "#initialize" do
    it "creates an empty array" do
      expect(@hand.cards).to be_empty
    end
  end
  describe "#add_card" do
    it "adds a card to the hand" do
      @hand.add_card
      expect(@hand.cards.length).to eq(1)
    end
    it "raises an error if hand already has 5 cards" do
      5.times {@hand.add_card}
      expect{ @hand.add_card }.to raise_error(StandardError)
    end
  end
  describe "#swap_cards!" do
    before do
      @full_hand = Hand.new(Deck.make_deck)
      5.times do
        @full_hand.add_card
      end
    end
    it "raises an error if more than 3 indices provided" do
      expect{@full_hand.swap_cards!([1,2,3,4])}.to raise_error(ArgumentError)
    end
    it "discards the selected cards and replaces them" do
      swapped_cards = @full_hand.cards[1..3].dup
      @full_hand.swap_cards!([1,2,3])
      expect(@full_hand.cards[1..3]).to_not eq(swapped_cards)
    end
  end

  describe "#parse_hand_type" do
    before(:each) { @test_hand = Hand.new(Deck.make_deck) }
    it "should parse royal flush" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.royal_flush).to eq(:royal_flush)
    end

    it "should parse straight flush" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:nine,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.straight_flush).to eq(:straight_flush)
    end
    it "should parse four of a kind" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ten,:diamonds), Card.new(:ten,:hearts), Card.new(:ten,:clubs), Card.new(:jack,:spades)]
      expect(@test_hand.four_of_a_kind).to eq(:four_of_a_kind)
    end
    it "should parse full house" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.full_house).to eq(:full_house)

    end
    it "should parse flush" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.flush).to eq(:flush)

    end
    it "should parse straight" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.straight).to eq(:straight)

    end
    it "should parse three of a kind" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.three_of_a_kind).to eq(:three_of_a_kind)

    end
    it "should parse two pair" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.two_pair).to eq(:two_pair)

    end
    it "should parse pair" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.pair).to eq(:pair)

    end
    it "should parse high card" do
      @test_hand.cards = [Card.new(:ten,:spades), Card.new(:ace,:spades), Card.new(:king,:spades), Card.new(:queen,:spades), Card.new(:jack,:spades)]
      expect(@test_hand.parse_hand_type).to eq(:royal_flush)
    end
  end

  describe "#parse_hand" do
    it "should assign hand type"
    it "should store cards that make hand"
    it "should store high card in made hand"
    it "should store other cards in hand"
    it "should store high card in other card, aka kicker"
  end
  describe "#compare_hands" do
    it "should take a hand as an argument"
    it "should compare hand types"
    it "should compare high card if same type"
    it "should compare kicker if same type and high card"
    it "should compare second kicker if first kicker same"
    it "should return tie if exact same hands"
  end

end
