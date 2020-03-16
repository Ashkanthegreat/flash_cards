class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @number_correct += 1 unless turn.correct? != true
    @turns << turn
    @deck.cards.shift()
    turn
  end

  def number_correct_by_category(category)
     @turns.select { |turn| turn.correct? && turn.card.category == category}.count
  end

end
