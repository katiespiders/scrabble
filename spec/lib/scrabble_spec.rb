require 'spec_helper.rb'

describe Scrabble do
  it "scores is accessible" do
    expect(Scrabble::SCORES[1].include? 'a').to eq true
  end

  describe "class methods" do
    describe "#self.score" do
      it "sets score to an integer" do
        expect(Scrabble.score("bear").class).to eq Fixnum
      end

      it "returns correct scores" do
        expect(Scrabble.score("bear")).to eq 6
        expect(Scrabble.score("qat")).to eq 12
        expect(Scrabble.score("it")).to eq 2
      end
    end

    describe "#self.highest_score_from(array)" do
      let (:test_array) {['bear', 'and', 'quilts']}
      let (:test_array_hash) { Hash[test_array.collect { |word| [word, Scrabble.score(word)]}] }

      it "converts array to hash with scores and finds max score" do
        expected_hash = {'bear'=>6, 'and'=>4, 'quilts'=>15}
        expect(test_array_hash).to eq expected_hash
        expect(expected_hash.values.max).to eq 15
      end

      it "identifies highest score with no ties" do
        expect(Scrabble.highest_score_from(test_array)).to eq 'quilts'
      end
    end
  end

  describe "helper methods" do
    describe "#break_ties(array, best_score)" do
      let (:test_array) {['bear', 'and', 'squid', 'quilts']}
      it "returns shortest word when tied for high score" do
        expect(Scrabble.break_ties(test_array, 15)).to eq 'squid'
      end

      let (:longer_test_array) { ['bear', 'and', 'quids', 'squid', 'quilts'] }
      it "returns first word listed when tied for high score and length" do
        expect(Scrabble.break_ties(longer_test_array, 15)).to eq 'quids'
      end

      let (:longest_test_array) {['bear', 'and', 'squid', 'quilts', 'quids', 'vamping']}
      it "returns 7-letter word when tied for high score" do
        expect(Scrabble.break_ties(longest_test_array, 15)).to eq 'vamping'
      end
    end
  end

end
