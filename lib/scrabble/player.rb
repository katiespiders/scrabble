class Player
  attr_accessor :name, :plays

  def initialize(name)
    @name = name
    @plays = []
    @total = 0
  end

  def play(word)
    @plays << word
  end

  def total_score
    @plays.each { |word| @total += Scrabble.score(word) }
    @total
  end

  def won?
    total_score > 100
  end

  def highest_scoring_word
    Scrabble.highest_score_from(@plays)
  end

  def highest_word_score
    Scrabble.score(highest_scoring_word)
  end


end
