require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require './lib/card'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_it_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_take_turn
    new_turn = @round.take_turn('Juneau')
    assert_equal "Juneau", new_turn.guess
    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal @card_1, new_turn.card
    assert_equal :Geography, new_turn.card.category
  end

  



end
