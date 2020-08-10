require_relative 'piece.rb'

class Knight < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "black" ? "\u2658" : "\u265E").encode('utf-8')
    @score = 3
    @jump = true
    @moves = []
    set_moves
  end

  def set_moves
    @moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end
end