class Cell

  def initialize(row, column, status = :empty)
    @row = row
    @column = column
    @status = status
  end

  def is_empty?
    @status == :empty
  end

end