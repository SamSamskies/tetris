class Cell

  def initialize(index, status = :empty)
    @index = index
    @status = status
  end

  def is_empty?
    @status == :empty
  end

end