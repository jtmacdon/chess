require "piece.rb"

class Bishop < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2657" : "\u265D").encode('utf-8')
    @moves
  end
end