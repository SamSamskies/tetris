require_relative 'cell'

class Playfield

  def initialize
    @cells = create_cells
  end

  def create_cells
    Array.new(200).map.with_index { |cell, index| Cell.new index }
  end

end