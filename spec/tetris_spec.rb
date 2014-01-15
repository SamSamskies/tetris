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

    describe "#move_left!" do

      it "moves the piece to the left" do
        @game.move_left!
        @game.instance_variable_get(:@current_piece).cells[0].row.should eq Square::START_ROW
        @game.instance_variable_get(:@current_piece).cells[1].row.should eq Square::START_ROW
        @game.instance_variable_get(:@current_piece).cells[2].row.should eq Square::START_ROW + 1
        @game.instance_variable_get(:@current_piece).cells[3].row.should eq Square::START_ROW + 1
        @game.instance_variable_get(:@current_piece).cells[0].col.should eq Square::START_COL - 1
        @game.instance_variable_get(:@current_piece).cells[1].col.should eq Square::START_COL
        @game.instance_variable_get(:@current_piece).cells[2].col.should eq Square::START_COL - 1
        @game.instance_variable_get(:@current_piece).cells[3].col.should eq Square::START_COL
      end

    end

    describe "#move_right!" do

      it "moves the piece to the right" do
        @game.move_right!
        @game.instance_variable_get(:@current_piece).cells[0].row.should eq Square::START_ROW
        @game.instance_variable_get(:@current_piece).cells[1].row.should eq Square::START_ROW
        @game.instance_variable_get(:@current_piece).cells[2].row.should eq Square::START_ROW + 1
        @game.instance_variable_get(:@current_piece).cells[3].row.should eq Square::START_ROW + 1
        @game.instance_variable_get(:@current_piece).cells[0].col.should eq Square::START_COL + 1
        @game.instance_variable_get(:@current_piece).cells[1].col.should eq Square::START_COL + 2
        @game.instance_variable_get(:@current_piece).cells[2].col.should eq Square::START_COL + 1
        @game.instance_variable_get(:@current_piece).cells[3].col.should eq Square::START_COL + 2
      end

    end

    describe "#drop!" do

      it "drops the piece into place and updates Playfield accordingly" do
        @game.drop!
        @playfield.cells[4].is_empty?.should eq false
        @playfield.cells[5].is_empty?.should eq false
        @playfield.cells[14].is_empty?.should eq false
        @playfield.cells[15].is_empty?.should eq false

        @game.drop!
        @playfield.cells[24].is_empty?.should eq false
        @playfield.cells[25].is_empty?.should eq false
        @playfield.cells[34].is_empty?.should eq false
        @playfield.cells[35].is_empty?.should eq false

        @game.drop!
        @playfield.cells[44].is_empty?.should eq false
        @playfield.cells[45].is_empty?.should eq false
        @playfield.cells[54].is_empty?.should eq false
        @playfield.cells[55].is_empty?.should eq false
      end

    end

    describe "#first_available_row" do

      it "returns the first available row" do
        @game.first_available_row.should eq 0
        @game.drop!
        @game.first_available_row.should eq 2

        20.times do
          @game.drop!
        end

        @game.first_available_row.should eq 22
      end

    end

  end

end