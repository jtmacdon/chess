require "piece.rb"

class Rook < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2656" : "\u265C").encode('utf-8')
    @moves
  end
end