class Cell

  def initialize(row, column, status = :empty)
    @row = row
    @columne = column
    @status = status
  end

  def is_empty?
    @status == :empty
  end

end