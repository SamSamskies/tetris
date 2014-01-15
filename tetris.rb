require_relative 'playfield'
require_relative 'square'

class Tetris

  VALID_PIECES = ["Square"]

  def initialize
    @playfield = Playfield.new
  end

  def random_piece
    Object.const_get(VALID_PIECES.shuffle.first).new
  end

  def move_left!(piece)
    piece.move_left!
  end

end