require 'spec_helper'

describe Playfield do

  before(:each) do
    @playfield = Playfield.new
  end

  context "when created" do

    it "has a @cells array filled with Cell objects" do
      @playfield.cells.all? { |cell| cell.is_a? Cell }.should eq true
    end

    context "all of the cells in @cells should" do

      it "have an rows corresponding to it's index in the array" do
        @playfield.cells.each_with_index.all? do |cell, index|
          cell.row == (index / Playfield::NUM_OF_COLS)
        end.should eq true
      end

      it "have an columns corresponding to it's index in the array" do
        @playfield.cells.each_with_index.all? do |cell, index|
          cell.col == (index % Playfield::NUM_OF_COLS)
        end.should eq true
      end

      it "have a status of empty" do
        @playfield.cells.all? { |cell| cell.is_empty? }.should eq true
      end

    end

  end

end


