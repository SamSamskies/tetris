require_relative 'playfield'
require_relative 'square'
require_relative 'cell'

class Tetris

  VALID_PIECES = ["Square"]

  def initialize
    @playfield = Playfield.new
    @current_piece = random_piece
  end

  # demo just loops forever printing out how many cells are currently filled which should never reach more than 220
  def demo_play
    while true
      rand(9).times do
        random_move
        drop!
        display_current_state
        sleep 1
      end
    end
  end

  # for testing demo play in command line only
  def display_current_state
    puts @playfield.cells.select { |cell| cell.is_filled? }.count
  end

  def random_move
    [true, false].shuffle.first ? move_left! : move_right!
  end

  def random_piece
    Object.const_get(VALID_PIECES.shuffle.first).new
  end

  def move_left!
    @current_piece.move_left!
  end

  def move_right!
    @current_piece.move_right!
  end

  def drop!
    row = first_available_row

    # Do nothing if no space avaialbe for piece
    return if row > (Playfield::NUM_OF_ROWS - 2)

    @current_piece.drop! row, @current_piece.cells[0].col
    update_playfield
    @current_piece = random_piece
  end

  def first_available_row
    (Playfield::NUM_OF_ROWS - 1).downto(0) do |row|
      0.upto(@current_piece.width - 1) do |n|
        index = translate_coordinates_to_index row, @current_piece.cells[0].col + n

        return row + 1 if @playfield.cells[index].is_filled?
      end
    end

    # return 0 if no blocking row found
    0
  end

  def update_playfield
    @current_piece.cells.each do |cell|
      index = translate_coordinates_to_index cell.row, cell.col
      @playfield.cells[index].status = :filled
    end
  end

  def translate_coordinates_to_index(row, col)
    10 * row + col
  end

end

## DRIVER CODE FOR DEMO PLAY
# game = Tetris.new
# game.demo_play