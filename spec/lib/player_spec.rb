require 'spec_helper.rb'

describe Player do
  describe "class methods" do
    let (:player) { Player.new("Batman") }
    describe "#initialize(name)" do
      it "creates instance with name assigned to @name" do
        expect(player.name).to eq "Batman"
      end
    end
  end

  describe "instance methods" do
    let (:player) { Player.new("Batman") }
    let (:words) { ['bear', 'and', 'squid']}
    let (:awesome_words) {
      [
        'buffy',
        'vampire',
        'slayer',
        'spike',
        'xander',
        'willow',
        'sunnydale',
        'hellmouth'
      ]
    }
    describe "#plays" do
      it "returns an empty array when player initialized" do
        expect(player.plays).to eq []
      end
    end

    describe "#play(word)" do
      it "adds the word to the @plays array" do
        words.each { |word| player.play(word) }
        expect(player.plays).to eq ['bear','and','squid']
      end

      it "returns false if player has won" do
        awesome_words.each { |word| player.play(word) }
        expect(player.play('anya')).to eq false
      end
    end

    describe "#total_score" do
      it "words have total score of 25" do
        words.each { |word| player.play(word) }
        expect(player.total_score).to eq 25
      end

      it "awesome words have total score of 106" do
        awesome_words.each { |word| player.play(word) }
        expect(player.total_score).to eq 106
      end
    end

    describe "#won?" do
      it "returns true if player has over 100 points" do
        awesome_words.each { |word| player.play(word) }
        expect(player.won?).to eq true
      end

      it "returns false otherwise" do
        words.each { |word| player.play(word) }
        expect(player.won?).to eq false
      end
    end

    describe "#highest_scoring_word" do
      it "returns squid from short array" do
        words.each { |word| player.play(word) }
        expect(player.highest_scoring_word).to eq "squid"
      end

      it "returns hellmouth from awesome array" do
        awesome_words.each { |word| player.play(word) }
        expect(player.highest_scoring_word).to eq "hellmouth"
      end
    end

    describe "#highest_word_score" do
      it "returns 15 for squid from short array" do
        words.each { |word| player.play(word) }
        expect(player.highest_word_score).to eq 15
      end

      it "returns 17 for hellmouth from awesome array" do
        awesome_words.each { |word| player.play(word) }
        expect(player.highest_word_score).to eq 17
      end
    end

    describe "#tiles" do
      it "returns an array" do
        expect(player.tiles.class).to eq Array
      end
    end

    describe "#draw_tiles(tile_bag)" do
      let (:tile_bag) {TileBag.new}
      it "returns an array of length 7" do
        drawn_tiles = player.draw_tiles(tile_bag)
        expect(drawn_tiles.class).to eq Array
        expect(drawn_tiles.length).to eq 7
      end
    end
  end
end
