require 'spec_helper'

describe Square do

  before(:each) do
    @square = Square.new
    @cells = @square.instance_variable_get(:@cells)
  end

  context "when created" do

    it "has cells with the correct row coordinates" do
      @cells[0].instance_variable_get(:@row).should eq 21
      @cells[1].instance_variable_get(:@row).should eq 21
      @cells[2].instance_variable_get(:@row).should eq 22
      @cells[3].instance_variable_get(:@row).should eq 22
    end

    it "has cells with the correct column coordinates" do
      @cells[0].instance_variable_get(:@column).should eq 5
      @cells[1].instance_variable_get(:@column).should eq 6
      @cells[2].instance_variable_get(:@column).should eq 5
      @cells[3].instance_variable_get(:@column).should eq 6
    end

  end

  describe "#update_cells" do

    it "updates the cells of the square accordingly" do
      @square.update_cells Cell.new(21, 0), Cell.new(21, 1), Cell.new(22, 0), Cell.new(22, 1)
      cells = @square.instance_variable_get(:@cells)
      @cells[0].instance_variable_get(:@row).should eq 21
      @cells[1].instance_variable_get(:@row).should eq 21
      @cells[2].instance_variable_get(:@row).should eq 22
      @cells[3].instance_variable_get(:@row).should eq 22
      @cells[0].instance_variable_get(:@column).should eq 0
      @cells[1].instance_variable_get(:@column).should eq 1
      @cells[2].instance_variable_get(:@column).should eq 0
      @cells[3].instance_variable_get(:@column).should eq 1
    end

  end

end