class Piece
  attr_accessor :color, :position
  def initialize(color, position)
    @color = color
    @position = position  
    @attack_moves = nil
  end

  def can_jump?
    return @jump
  end
end