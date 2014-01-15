class Square

  START_ROW = 21
  START_COL = 5

  def initialize
    @cells = [
      Cell.new(START_ROW, START_COL),
      Cell.new(START_ROW, START_COL + 1),
      Cell.new(START_ROW + 1, START_COL),
      Cell.new(START_ROW + 1, START_COL + 1)
    ]
  end

  def update_cells(new_bottom_left_coordinates)
    row, col = new_bottom_left_coordinates

    cell1 = @cells[0]
    cell1.row = row
    cell1.col = col

    cell2 = @cells[1]
    cell2.row = row
    cell2.col = col + 1

    cell3 = @cells[2]
    cell3.row = row + 1
    cell3.col = col

    cell4 = @cells[3]
    cell4.row = row + 1
    cell4.col = col + 1
  end

  def move_left!
    # Do nothing if first cell's column is 0
    return if @cells[0].col == 0

    update_cells [@cells[0].row, @cells[0].col - 1]
  end

  def move_right!
    # Do nothing if bottom right cell's column is at the right edge
    return if @cells[1].col == Playfield::NUM_OF_COLS - 1

    update_cells [@cells[0].row, @cells[0].col + 1]
  end

end