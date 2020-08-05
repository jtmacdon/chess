require "piece.rb"

class Knight < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2658" : "\u265E").encode('utf-8')
    @moves
  end
end