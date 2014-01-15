require 'spec_helper'

describe Square do

  before(:each) do
    @square = Square.new
    @cells = @square.instance_variable_get(:@cells)
  end

  context "when created" do

    it "has cells with the correct row coordinates" do
      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
    end

    it "has cells with the correct column coordinates" do
      @cells[0].instance_variable_get(:@col).should eq Square::START_COL
      @cells[1].instance_variable_get(:@col).should eq Square::START_COL + 1
      @cells[2].instance_variable_get(:@col).should eq Square::START_COL
      @cells[3].instance_variable_get(:@col).should eq Square::START_COL + 1
    end

  end

  describe "#update_cells" do

    it "updates the cells of the square accordingly" do
      @square.update_cells [Square::START_ROW, 0]

      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@col).should eq 0
      @cells[1].instance_variable_get(:@col).should eq 1
      @cells[2].instance_variable_get(:@col).should eq 0
      @cells[3].instance_variable_get(:@col).should eq 1
    end

  end

  describe "#move_left!" do

    it "moves the square to the left if space available on the left" do
      @square.move_left!
      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@col).should eq Square::START_COL - 1
      @cells[1].instance_variable_get(:@col).should eq Square::START_COL
      @cells[2].instance_variable_get(:@col).should eq Square::START_COL - 1
      @cells[3].instance_variable_get(:@col).should eq Square::START_COL
    end

    it "doesn't move the square if no space available on the left" do
      5.times do
        @square.move_left!
      end

      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@col).should eq 0
      @cells[1].instance_variable_get(:@col).should eq 1
      @cells[2].instance_variable_get(:@col).should eq 0
      @cells[3].instance_variable_get(:@col).should eq 1
    end

  end

  describe "#move_right!" do

    it "moves the square to the right if space available on the right" do
      @square.move_right!
      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@col).should eq Square::START_COL + 1
      @cells[1].instance_variable_get(:@col).should eq Square::START_COL + 2
      @cells[2].instance_variable_get(:@col).should eq Square::START_COL + 1
      @cells[3].instance_variable_get(:@col).should eq Square::START_COL + 2
    end

    it "doesn't move the square if no space available on the right" do
      5.times do
        @square.move_right!
      end

      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@col).should eq Playfield::NUM_OF_COLS - 2
      @cells[1].instance_variable_get(:@col).should eq Playfield::NUM_OF_COLS - 1
      @cells[2].instance_variable_get(:@col).should eq Playfield::NUM_OF_COLS - 2
      @cells[3].instance_variable_get(:@col).should eq Playfield::NUM_OF_COLS - 1
    end

  end

end