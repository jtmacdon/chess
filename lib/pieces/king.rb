require "piece.rb"

class King < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2654" : "\u265A").encode('utf-8')
    @score = nil
    @jump = false
    @moves = []
    set_moves
  end

    def set_moves
      @moves = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    end
end