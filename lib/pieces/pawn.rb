require_relative 'piece.rb'

class Pawn < Piece
  attr_accessor :icon, :moves
  
  def initialize(color, position)
    super(color, position)
    @icon = (@color == "white" ? "\u2659" : "\u265F").encode('utf-8')
    @score = 1
    @jump = false
    @moves = []
    set_moves
  end

  def set_moves
    if @color == "white"
      @moves = [[0, 1]]
      @attack_moves = [[-1, 1], [1, 1]]
    else
      @moves = [[0, -1]]
      @attack_moves = [[-1, -1], [1, -1]]
    end
  end
end