require_relative '../tetris'

describe Tetris do

  before(:each) do
    @game = Tetris.new
  end

  it "has a Playfield with correct amount of cells when created" do
    playfield = @game.instance_variable_get(:@playfield)
    playfield.instance_variable_get(:@cells).count.should eq 200
  end

end