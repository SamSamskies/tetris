require_relative '../tetris'

describe Tetris do

  before(:each) do
    @game = Tetris.new
  end

  context "when initialized" do

    before(:each) do
      playfield = @game.instance_variable_get(:@playfield)
      @playfield_cells = playfield.instance_variable_get(:@cells)
    end

    it "should have a Playfield with correct amount of cells" do
      @playfield_cells.count.should eq 200
    end

    it "should have a Playfield filled with Cell objects" do
      @playfield_cells.all? { |cell| cell.is_a? Cell }
    end

  end

end