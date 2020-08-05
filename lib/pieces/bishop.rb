require "piece.rb"

class Bishop < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2657" : "\u265D").encode('utf-8')
    #creates array with all possible +/- permutations for each number
    @moves = []
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]].each { |x|
     x.repeated_permutation(2).to_a.each { |y| @moves << y} }
  end
end