require "piece.rb"

class King < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2654" : "\u265A").encode('utf-8')
    @moves
  end
end