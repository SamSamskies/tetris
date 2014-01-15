require 'spec_helper'

describe Square do

  before(:each) do
    @square = Square.new
  end

  context "when created" do

    it "has cells with the correct coordinates" do
      cells = @square.instance_variable_get(:@cells)
      cells[0].instance_variable_get(:@row).should eq 21
      cells[1].instance_variable_get(:@row).should eq 21
      cells[2].instance_variable_get(:@row).should eq 22
      cells[3].instance_variable_get(:@row).should eq 22
    end

  end

end