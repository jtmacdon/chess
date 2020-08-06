require_relative 'piece.rb'

class Bishop < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2657" : "\u265D").encode('utf-8')
    @score = 3
    @jump = false
    @moves = []
    set_moves
  end

  def set_moves
    temp = []
    
    7.times do |x|
      temp << [(x + 1), -(x + 1)]
    end

    temp.each { |x| x.repeated_permutation(2).to_a.each { |y| @moves << y} }
  end
end