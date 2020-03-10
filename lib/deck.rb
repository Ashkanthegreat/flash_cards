class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end
  
  def count
    @cards.size
  end

  def cards_in_category
    # cards.map {|cards| return card if card.category == category}
    category_array = []
    cards.each do |card|
      if card.category == category
        category_array << card
      end
    end
  end
end
