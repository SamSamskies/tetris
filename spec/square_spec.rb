require 'spec_helper'

describe Square do

  before(:each) do
    @square = Square.new
  end

  context "when created" do

    before(:each) do
      @cells = @square.instance_variable_get(:@cells)
    end

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

end