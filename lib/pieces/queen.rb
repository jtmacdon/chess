require "piece.rb"

class Queen < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2655" : "\u265B").encode('utf-8')
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
    temp = []
    
    7.times do |x|
      temp << [(x + 1), -(x + 1)]
    end

    temp.each { |x| x.repeated_permutation(2).to_a.each { |y| @moves << y} }
  end
end