describe TileBag do
  describe "class methods" do
    describe "#initialize" do
      it "creates an instance containing a hash" do
        bag = TileBag.new
        expect(bag.tiles.class).to eq Hash
      end
    end
  end

  describe "instance methods" do
    let (:game_bag) {TileBag.new}
    describe "#draw_tiles(n)" do
      it "returns an array of size n" do
        expect(game_bag.draw_tiles(4).length).to eq 4
      end

      it "returns an array of letters" do
        letter = game_bag.draw_tiles(4)[0]
        expect(letter.class).to eq String
        expect(letter.length).to eq 1
      end

      it "adjusts tile counts" do
        game_bag.draw_tiles(4)
        expect(game_bag.tiles_remaining).to eq 94
      end        
    end

    describe "#tiles_remaining" do
      it "returns 98 for new tilebag" do
        expect(game_bag.tiles_remaining).to eq 98
      end
    end
  end

end
