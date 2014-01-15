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
      @cells[0].instance_variable_get(:@column).should eq Square::START_COL
      @cells[1].instance_variable_get(:@column).should eq Square::START_COL + 1
      @cells[2].instance_variable_get(:@column).should eq Square::START_COL
      @cells[3].instance_variable_get(:@column).should eq Square::START_COL + 1
    end

  end

  describe "#update_cells" do

    it "updates the cells of the square accordingly" do
      @square.update_cells(
        Cell.new(Square::START_ROW, 0),
        Cell.new(Square::START_ROW, 1),
        Cell.new(Square::START_ROW + 1, 0),
        Cell.new(Square::START_ROW + 1, 1)
      )

      @cells[0].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[1].instance_variable_get(:@row).should eq Square::START_ROW
      @cells[2].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[3].instance_variable_get(:@row).should eq Square::START_ROW + 1
      @cells[0].instance_variable_get(:@column).should eq 0
      @cells[1].instance_variable_get(:@column).should eq 1
      @cells[2].instance_variable_get(:@column).should eq 0
      @cells[3].instance_variable_get(:@column).should eq 1
    end

  end

end