class Square

  START_BOTTOM_ROW = 21
  START_TOP_ROW = 22
  START_LEFT_COL = 5
  START_RIGHT_COL = 6

  def initialize
    @cells = [
      Cell.new(START_BOTTOM_ROW, START_LEFT_COL),
      Cell.new(START_BOTTOM_ROW, START_RIGHT_COL),
      Cell.new(START_TOP_ROW, START_LEFT_COL),
      Cell.new(START_TOP_ROW, START_RIGHT_COL)
    ]
  end

  def update_cells(cell1, cell2, cell3, cell4)
    @cells[0] = cell1
    @cells[1] = cell2
    @cells[2] = cell3
    @cells[3] = cell4
  end

end