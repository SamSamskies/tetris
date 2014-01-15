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
    row = first_available_row(piece)

    # Do nothing if no space avaialbe for piece
    return if row > (Playfield::NUM_OF_ROWS - 2)

    piece.drop! row, piece.cells[0].col
    update_playfield piece
  end

  def first_available_row(piece)
    (Playfield::NUM_OF_ROWS - 1).downto(0) do |row|
      0.upto(piece.width - 1) do |n|
        index = translate_coordinates_to_index row, piece.cells[0].col + n

        return row + 1 unless @playfield.cells[index].is_empty?
      end
    end

    # return 0 if no blocking row found
    0
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