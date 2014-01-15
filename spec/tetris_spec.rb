require 'spec_helper'

describe Tetris do

  before(:each) do
    @game = Tetris.new
    @playfield = @game.instance_variable_get(:@playfield)
  end

  it "has a Playfield with correct amount of cells when created" do
    @playfield.instance_variable_get(:@cells).count.should eq Playfield::NUM_OF_CELLS
  end

  describe "#random_piece" do

    # For now it will always be a Square
    it "returns a random piece" do
      @game.random_piece.is_a? Square
    end

  end

  context "moving pieces" do

    before(:each) do
      @piece = @game.random_piece
      @piece_cells = @piece.instance_variable_get(:@cells)
    end

  end

end