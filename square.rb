class Square

  def initialize
    @cells = [Cell.new(21, 5), Cell.new(21, 6), Cell.new(22, 5), Cell.new(22, 6)]
  end

  def update_cells(cell1, cell2, cell3, cell4)
    @cells[0] = cell1
    @cells[1] = cell2
    @cells[2] = cell3
    @cells[3] = cell4
  end

end