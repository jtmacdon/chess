require_relative './pieces/bishop.rb'
require_relative './pieces/king.rb'
require_relative './pieces/pawn.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/rook.rb'
require_relative 'board.rb'
class Game
  attr_accessor :gameboard
  def initialize
    @gameboard = Board.new
    create_pieces

  end


  def play_game

    

    gameboard.print_board

  end

  def create_pieces

    pieces = []

    #create pawns
    8.times do |x|
      pos = [x, 1]
      pieces << Pawn.new("black", pos)
    end

    8.times do |x|
      pos = [x, 6]
      pieces << Pawn.new("white", pos)
    end

    #create rooks
    pieces << Rook.new("black", [0, 0])
    pieces << Rook.new("black", [7, 0])

    pieces << Rook.new("white", [0, 7])
    pieces << Rook.new("white", [7, 7])

    #create knights
    pieces << Knight.new("black", [1, 0])
    pieces << Knight.new("black", [6, 0])

    pieces << Knight.new("white", [1, 7])
    pieces << Knight.new("white", [6, 7])

    #create bishops
    pieces << Bishop.new("black", [2, 0])
    pieces << Bishop.new("black", [5, 0])

    pieces << Bishop.new("white", [2, 7])
    pieces << Bishop.new("white", [5, 7])

    #create kings
    pieces << King.new("black", [3, 0])
    pieces <<King.new("white", [3, 7])

    #create queens
    pieces << Queen.new("black", [4, 0])
    pieces << Queen.new("white", [4, 7])


    pieces.each { |piece|
      gameboard.insert_piece(piece, piece.position)
    }

  end

end


game = Game.new

game.play_game