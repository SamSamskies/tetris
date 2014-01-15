require_relative '../tetris'

describe Tetris do

  before(:each) do
    @game = Tetris.new
  end

  it "has a Playfield with correct amount of cells when created" do
    playfield = @game.instance_variable_get(:@playfield)
    playfield.instance_variable_get(:@cells).count.should eq 220
  end

  describe "#random_piece" do

    # For now it will always be a Square
    it "returns a random piece" do

    end

  end

end