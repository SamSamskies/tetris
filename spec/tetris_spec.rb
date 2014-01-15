require 'spec_helper'

describe Tetris do

  before(:each) do
    @game = Tetris.new
    @playfield = @game.instance_variable_get(:@playfield)
  end

  it "has a Playfield with correct amount of cells when created" do
    @playfield.cells.count.should eq Playfield::NUM_OF_ROWS * Playfield::NUM_OF_COLS
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
    end

    describe "#move_left!" do

      it "moves the piece to the left" do
        @game.move_left! @piece
        @piece.cells[0].row.should eq Square::START_ROW
        @piece.cells[1].row.should eq Square::START_ROW
        @piece.cells[2].row.should eq Square::START_ROW + 1
        @piece.cells[3].row.should eq Square::START_ROW + 1
        @piece.cells[0].col.should eq Square::START_COL - 1
        @piece.cells[1].col.should eq Square::START_COL
        @piece.cells[2].col.should eq Square::START_COL - 1
        @piece.cells[3].col.should eq Square::START_COL
      end

    end

    describe "#move_right!" do

      it "moves the piece to the right" do
        @game.move_right! @piece
        @piece.cells[0].row.should eq Square::START_ROW
        @piece.cells[1].row.should eq Square::START_ROW
        @piece.cells[2].row.should eq Square::START_ROW + 1
        @piece.cells[3].row.should eq Square::START_ROW + 1
        @piece.cells[0].col.should eq Square::START_COL + 1
        @piece.cells[1].col.should eq Square::START_COL + 2
        @piece.cells[2].col.should eq Square::START_COL + 1
        @piece.cells[3].col.should eq Square::START_COL + 2
      end

    end

    describe "#drop!" do

      it "drops the piece into place and updates Playfield accordingly" do
        @game.drop! @piece
        @playfield.cells[4].is_empty?.should eq false
        @playfield.cells[5].is_empty?.should eq false
        @playfield.cells[14].is_empty?.should eq false
        @playfield.cells[15].is_empty?.should eq false

        @game.drop! @game.random_piece
        @playfield.cells[24].is_empty?.should eq false
        @playfield.cells[25].is_empty?.should eq false
        @playfield.cells[34].is_empty?.should eq false
        @playfield.cells[35].is_empty?.should eq false
      end

    end

  end

end