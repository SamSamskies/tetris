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

  def move_right!(piece)
    piece.move_right!
  end

  def drop!(piece)
    piece.drop!
    update_playfield piece
  end

  def update_playfield(piece)
    piece.cells.each do |cell|
      index = translate_coordinates_to_index cell.row, cell.col
      @playfield.cells[index].status = :filled
    end
  end

  def translate_coordinates_to_index(row, col)
    10 * row + col
  end

end