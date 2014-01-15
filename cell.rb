class Cell
  attr_accessor :row, :col, :filled

  def initialize(row, col, filled = false)
    @row = row
    @col = col
    @filled = filled
  end

  def is_empty?
    !@filled
  end

  def is_filled?
    @filled
  end

end