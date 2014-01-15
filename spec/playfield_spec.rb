require_relative '../playfield'

describe Playfield do

  before(:each) do
    @playfield = Playfield.new
  end

  context "when created" do

    before(:each) do
      @cells = @playfield.instance_variable_get(:@cells)
    end

    it "should have a Playfield filled with Cell objects" do
      @cells.all? { |cell| cell.is_a? Cell }.should eq true
    end

  end

end


