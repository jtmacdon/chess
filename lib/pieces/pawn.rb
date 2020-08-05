require "piece.rb"

class Pawn < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2659" : "\u265F").encode('utf-8')
    @moves
  end
end