class Playfield

  attr_reader :cells

  NUM_OF_COLS = 10
  NUM_OF_ROWS = 22

  def initialize
    @cells = create_cells
  end

  def create_cells
    Array.new(NUM_OF_ROWS * NUM_OF_COLS).map.with_index do |cell, index|
      row, column = index.divmod NUM_OF_COLS
      Cell.new row, column
    end
  end

end