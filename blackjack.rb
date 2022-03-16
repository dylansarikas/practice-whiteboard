class Card
  attr_accessor :suit, :name, :value

  def initialize(suit, name, value)
    @suit, @name, @value = suit, name, value
  end
end

class Deck
  attr_accessor :playable_cards
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  NAME_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => [11, 1]}

  def initialize
    shuffle
  end

  def deal_card
    random = rand(@playable_cards.size)
    @playable_cards.delete_at(random)
  end

  def shuffle
    @playable_cards = []
    SUITS.each do |suite|
      NAME_VALUES.each do |name, value|
        @playable_cards << Card.new(suite, name, value)
      end
    end
  end
end

class Hand
  attr_accessor :cards
  attr_reader :points

  def initialize
    @cards = []
    @points = 0
  end

  def value
    total = []
    cards.each do |card|
      total << card.value
    end
      
    @points = total.reduce(:+)
  end

end

class Player
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

end

class Dealer
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end
end

class Game
  attr_accessor :deck
  attr_accessor :player
  attr_accessor :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start_game
    player.hand.cards << deck.deal_card
    dealer.hand.cards << deck.deal_card
    player.hand.cards << deck.deal_card
    dealer.hand.cards << deck.deal_card
    # player.hand.value
    # dealer.hand.value
  end

  def turn
  end

  def hit
    player.hand.cards << deck.deal_card
    pp player
    p player.hand.value
  end

  def stay
  end
end

require 'test/unit'

# class CardTest < Test::Unit::TestCase
#   def setup
#     @card = Card.new(:hearts, :ten, 10)
#   end
  
#   def test_card_suit_is_correct
#     assert_equal @card.suit, :hearts
#   end

#   def test_card_name_is_correct
#     assert_equal @card.name, :ten
#   end
#   def test_card_value_is_correct
#     assert_equal @card.value, 10
#   end
# end

# class DeckTest < Test::Unit::TestCase
#   def setup
#     @deck = Deck.new
#   end
  
#   def test_new_deck_has_52_playable_cards
#     assert_equal @deck.playable_cards.size, 52
#   end
  
#   def test_dealt_card_should_not_be_included_in_playable_cards
#     card = @deck.deal_card
#     # pp card
#     # pp @deck
#     assert(!@deck.playable_cards.include?(card))
#     # assert_equal @deck.playable_cards.size, 51
#   end

#   def test_shuffled_deck_has_52_playable_cards
#     @deck.shuffle
#     assert_equal @deck.playable_cards.size, 52
#   end
# end

# deck = Deck.new
# hand = Hand.new
# hand.cards << deck.deal_card
# hand.cards << deck.deal_card
# pp hand
# p deck.playable_cards.length
# player = Player.new
# pp player.hand
# player.hand.cards << deck.deal_card
# player.hand.cards << deck.deal_card
# pp player.hand
# p player.hand.value

game = Game.new
game.start_game
# pp game.player
#pp game.player.hand
# pp game.dealer
#pp game.dealer.hand
game.hit
