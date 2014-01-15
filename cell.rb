class Cell
  attr_accessor :row, :col, :status

  def initialize(row, col, status = :empty)
    @row = row
    @col = col
    @status = status
  end

  def is_empty?
    @status == :empty
  end

end