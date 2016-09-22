require_relative 'player'
require_relative 'hand'

class Poker

  def initialize
    @players = make_players
    @pot = 0
  end

  def play_game
    until over?
      play_hand
      switch_dealer!
    end
    announce_winner
  end

  def deal_hands
    @players.each do |player|
      player.hand.clear
      5.times do
        player.hand.add_card(@deck.deal_card!)
      end
    end
  end

  def play_hand
    @deck = Deck.make_deck
    @deck.shuffle!
    deal_hands

    assess_hands
    display_hands

    swap_cards

    assess_hands
    display_hands

    hand_winner = decide_hand
    announce_result(hand_winner)
  end

  def swap_cards
    @players.each do |player|
      puts "*" * 35
      puts "#{player.name}, would you like to swap any cards?"
      puts "Enter indices of up to 3 cards. For example, 0,2,4."
      indices = gets.chomp.split(",")

      raise "Too many swaps!" if indices.length > 3

      indices.map!(&:to_i) unless indices.empty?

      indices.each do |index|
        player.hand.swap_card!(index, @deck.deal_card!)
      end
    end
  end

  def decide_hand
    best_hand = @players[0].hand
    winner = @players[0]
    @players.each do |player|
      next if player == winner
      current_hand = player.hand
      if current_hand.beats_hand?(best_hand)
        best_hand = current_hand
        winner = player
      end
    end
    winner
  end

  def announce_result(hand_winner)
    puts "#{hand_winner.name} wins this hand with a #{hand_winner.hand.hand_type}"
    puts "*" * 35
  end

  def assess_hands
    @players.each do |player|
      player.assess_hand
    end
  end

  def display_hands
    @players.each do |player|
      puts "*" * 35
      puts "#{player.name}'s hand: #{player.show_hand}"
    end
  end

  def switch_dealer!
    @players.rotate!
  end

  def select_solvent_players
    @players.select { |player| player.stack > 0 }
  end

  def over?
    select_solvent_players.length == 1
  end

  def announce_winner
    "#{select_solvent_players[0].name} wins!"
  end


  def make_players
    puts "*" * 35
    puts "How many players do you want?"
    num_players = gets.chomp.to_i

    names = get_names(num_players)
    puts "How much money should each player start with?"
    stack = gets.chomp.to_i

    players = []
    num_players.times do |n|
      players << Player.new(names[n], stack, @deck)
    end
    players
  end

  def get_names(num_players)
    player_names = []
    puts "What are their names?"
    num_players.times do |n|
      puts "Player #{n+1}'s name:"
      player_names[n] = gets.chomp
    end
    player_names
  end
end

if __FILE__ == $0
  game = Poker.new
  game.play_game
end
