class Scrabble

  SCORES = {
    1=> 'aeioulnrst',
    2=> 'dg',
    3=> 'bcmp',
    4=> 'fhvwy',
    5=> 'k',
    8=> 'jx',
    10=> 'qz'
  }

  def self.score(word)
    @score = 0

    word.downcase.each_char do |ch|
      SCORES.each do |score, letters|
        if letters.include? ch
          @score += score
        end
      end
    end
    @score
  end

  def self.highest_score_from(array)
    score_hash = array_hash(array)
    scores = score_hash.values
    best_score = scores.max

    if scores.count(best_score) == 1
      return score_hash.key(best_score)
    else
      break_ties(array, best_score)
    end
  end

  def self.break_ties(array, best_score)
    lengths_of_ties = {}
    array_hash(array).each do |word, score|
      lengths_of_ties[word] = word.length if score == best_score
    end
    lengths = lengths_of_ties.values

    winning_length = lengths.max == 7 ? 7 : lengths.min

    if lengths.count(winning_length) == 1
      return lengths_of_ties.key(winning_length)
    else
      break_by_index(array, best_score, winning_length)
    end
  end

  def self.break_by_index(array, best_score, winning_length)
    index = array.index { |word| score(word) == best_score && word.length == winning_length }
    array[index]
  end

  def self.array_hash(array)
    Hash[array.collect { |word| [word, score(word)] }]
  end
end
