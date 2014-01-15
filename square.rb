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

  def update_cells(cell1, cell2, cell3, cell4)
    @cells[0] = cell1
    @cells[1] = cell2
    @cells[2] = cell3
    @cells[3] = cell4
  end

end