class Move
  attr_reader :cell_number, :player

  def initialize(cell, player)
    @cell_number = cell.to_i
    @player = player
  end
end
