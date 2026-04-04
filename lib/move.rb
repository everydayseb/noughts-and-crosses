class Move
  attr_reader :cell_number, :player
  attr_accessor :valid

  def initialize(cell, player)
    @cell_number = cell.to_i
    @player = player
  end
end