require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'



class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new('Which planet is closest to the Sun?', 'Mercury', :STEM)
    @turn = Turn.new("Juneau", @card)
    @turn2 = Turn.new("Saturn", @card2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal 'Juneau', @turn.guess
  end

  def test_guess_is_correct?
    assert_equal true, @turn.correct?
  end

  def test_it_can_give_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_incorrect_guess
    assert_equal @card2, @turn2.card
    assert_equal false, @turn2.correct?
    assert_equal 'Incorrect', @turn2.feedback
  end

end
