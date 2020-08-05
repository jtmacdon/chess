require "piece.rb"

class Queen < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2655" : "\u265B").encode('utf-8')
    @moves
  end
end