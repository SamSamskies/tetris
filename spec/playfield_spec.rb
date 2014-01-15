require 'spec_helper'

describe Playfield do

  before(:each) do
    @playfield = Playfield.new
  end

  context "when created" do

    before(:each) do
      @cells = @playfield.instance_variable_get(:@cells)
    end

    it "has a @cells array filled with Cell objects" do
      @cells.all? { |cell| cell.is_a? Cell }.should eq true
    end

    context "all of the cells in @cells should" do

      it "have an rows corresponding to it's index in the array" do
        @cells.each_with_index.all? do |cell, index|
          cell.instance_variable_get(:@row) == (index / Playfield::NUM_OF_COLS)
        end
      end

      it "have an columns corresponding to it's index in the array" do
        @cells.each_with_index.all? do |cell, index|
          cell.instance_variable_get(:@column) == (index % Playfield::NUM_OF_COLS)
        end
      end

      it "have a status of empty" do
        @cells.all? { |cell| cell.is_empty? }.should eq true
      end

    end

  end

end


