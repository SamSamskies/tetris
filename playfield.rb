require_relative 'cell'

class Playfield

  NUM_OF_CELLS = 220
  NUM_OF_COLS = 10

  def initialize
    @cells = create_cells
  end

  def create_cells
    Array.new(NUM_OF_CELLS).map.with_index do |cell, index|
      row, column = index.divmod NUM_OF_COLS
      Cell.new row, column
    end
  end

end