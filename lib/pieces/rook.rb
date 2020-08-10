require_relative 'piece.rb'

class Rook < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "black" ? "\u2656" : "\u265C").encode('utf-8')
    @score = 5
    @jump = false
    @moves = []
    set_moves
  end

  def set_moves
    temp = []

    7.times do |x|
      temp << [x + 1, 0]
      temp << [-(x + 1), 0]
    end

    temp.each { |x| @moves << x.permutation(2).to_a}
    @moves = @moves.flatten(1)
  end
end