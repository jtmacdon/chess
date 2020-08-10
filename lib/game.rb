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
    @player1 = "white"
    @player2 = "black"
    @current_player = @player2
    @winner = false

  end


  def play_game

    while !@winner
      @gameboard.print_board
      get_move
      @current_player = (@current_player == @player1 ? @player2 : @player1)
    end
      
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

  def get_move
    puts "#{@current_player == @player1 ? "White's" : "Black's"} turn! Enter your move (hint: 3g:3e):"
    str = gets.chomp
    input = str.split('')
    #check that input hass all the right elements
    if input.length == 5 && input[2] == ":" && (0..7).include?(input[0].to_i) && 
      (0..7).include?(input[3].to_i) && ("a".."h").include?(input[1].downcase) && 
      ("a".."h").include?(input[4].downcase)

      str = str.split(":")
      pos = str[0]
      pos[1] = (pos[1].downcase.ord - 97).to_s
      target = str[1]
      target[1] = (target[1].downcase.ord - 97).to_s
      pos_array = pos.split('')
      target_array = target.split('')


      if @gameboard.not_occupied?(pos)
        puts "There's no piece there to move, try again!"
        get_move
      elsif @gameboard.get_color(pos) != @current_player
        puts "That's not your piece, try again!"
        get_move
      elsif @gameboard.get_color(pos) == @current_player
        if !@gameboard.not_occupied?(target)
          puts "There's already something there, try again!"
          get_move
        elsif @gameboard.not_occupied?(target)
          move(pos, target)
        end
      else
        puts "Something went wrong"
      end
      
    else
      puts "Invalid input, try again!"
      puts "Remember that where your piece is comes first, then where you want to go\n"
      get_move
    end

  end

  def move(pos, target)
  
    #piece_index = to_index(pos)
    #target_index = to_index(target)
    if gameboard.not_occupied?(target)
      piece = @gameboard.board[pos]
      gameboard.insert_piece(piece, target)
      gameboard.remove_piece(pos)
      return true
    else
      return false
    end

  end

  def to_index(arr)
    return arr[0].to_s + arr[1].to_s
  end

end


game = Game.new

game.play_game

#game.move([0, 6], [0, 5])

#game.play_game

#game.move([1, 6], [0, 5])

#game.play_game


