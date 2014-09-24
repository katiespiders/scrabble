class Player
  attr_accessor :name, :plays, :tiles

  def initialize(name)
    @name = name
    @plays, @tiles = [], []
  end

  def draw_tiles(tile_bag)
    tiles_drawn = 7 - @tiles.length
    @tiles += tile_bag.draw_tiles(tiles_drawn)
  end

  def play(word)
    if won? then return false end
    @plays << word
  end

  def total_score
    total = 0
    @plays.each { |word| total += Scrabble.score(word) }
    total
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
