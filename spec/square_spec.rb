require 'spec_helper'

describe Square do

  before(:each) do
    @square = Square.new
  end

  context "when created" do

    it "has cells with the correct row coordinates" do
      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
    end

    it "has cells with the correct column coordinates" do
      @square.cells[0].col.should eq Square::START_COL
      @square.cells[1].col.should eq Square::START_COL + 1
      @square.cells[2].col.should eq Square::START_COL
      @square.cells[3].col.should eq Square::START_COL + 1
    end

  end

  describe "#update_cells" do

    it "updates the cells of the square accordingly" do
      @square.update_cells [Square::START_ROW, 0]

      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
      @square.cells[0].col.should eq 0
      @square.cells[1].col.should eq 1
      @square.cells[2].col.should eq 0
      @square.cells[3].col.should eq 1
    end

  end

  describe "#move_left!" do

    it "moves the square to the left if space available on the left" do
      @square.move_left!
      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
      @square.cells[0].col.should eq Square::START_COL - 1
      @square.cells[1].col.should eq Square::START_COL
      @square.cells[2].col.should eq Square::START_COL - 1
      @square.cells[3].col.should eq Square::START_COL
    end

    it "doesn't move the square if no space available on the left" do
      5.times do
        @square.move_left!
      end

      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
      @square.cells[0].col.should eq 0
      @square.cells[1].col.should eq 1
      @square.cells[2].col.should eq 0
      @square.cells[3].col.should eq 1
    end

  end

  describe "#move_right!" do

    it "moves the square to the right if space available on the right" do
      @square.move_right!
      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
      @square.cells[0].col.should eq Square::START_COL + 1
      @square.cells[1].col.should eq Square::START_COL + 2
      @square.cells[2].col.should eq Square::START_COL + 1
      @square.cells[3].col.should eq Square::START_COL + 2
    end

    it "doesn't move the square if no space available on the right" do
      5.times do
        @square.move_right!
      end

      @square.cells[0].row.should eq Square::START_ROW
      @square.cells[1].row.should eq Square::START_ROW
      @square.cells[2].row.should eq Square::START_ROW + 1
      @square.cells[3].row.should eq Square::START_ROW + 1
      @square.cells[0].col.should eq Playfield::NUM_OF_COLS - 2
      @square.cells[1].col.should eq Playfield::NUM_OF_COLS - 1
      @square.cells[2].col.should eq Playfield::NUM_OF_COLS - 2
      @square.cells[3].col.should eq Playfield::NUM_OF_COLS - 1
    end

  end

  describe "#drop!" do

    it "updates coordinates of cells accordingly when dropped" do
      @square.drop! 0, Square::START_COL

      @square.cells[0].row.should eq 0
      @square.cells[1].row.should eq 0
      @square.cells[2].row.should eq 1
      @square.cells[3].row.should eq 1
      @square.cells[0].col.should eq Square::START_COL
      @square.cells[1].col.should eq Square::START_COL + 1
      @square.cells[2].col.should eq Square::START_COL
      @square.cells[3].col.should eq Square::START_COL + 1
    end

  end

end