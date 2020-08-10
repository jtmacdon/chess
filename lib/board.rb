
class Board
  attr_accessor :board
  def initialize
    @board = {}
    create_board
  end

  def create_board
    for y in (0..7)
      for x in (0..7)
        str = x.to_s + y.to_s
        @board[str] = nil
      end
    end
  end

  def print_board
    #initialize unicode symbols
    b_sq = "\u25A0".encode("utf-8")
    w_sq = "\u25A1".encode("utf-8")
    mid_line = "\u2503".encode('utf-8') 
    lines = create_line

    flip = false
    str = ""  
    puts lines[0]

    for y in (0..7)
      str += ("a".ord + y).chr + " "

      for x in (0..7)

        pos = x.to_s + y.to_s
        str += mid_line
        if not_occupied?(pos)
          str += (flip ? b_sq : w_sq)
        else
          str += @board[pos].icon
        end
        flip = !flip
        
      end
      str += mid_line
      flip = !flip
      puts str
      puts y < 7 ? lines[1] : lines[2]
      str = ""
    end
    s = "\u2006".encode('utf-8')
    #puts "   #{s}0 #{s}1 #{s}2 #{s + s}3 #{s}4 #{s}5#{s} 6 #{s}7"
    puts "   0 1 2 3 4 5 6 7"
  end

  #helper function to for print_board to make top and bottom lines
  def create_line
    line = Array.new(3)
    line[0] = "  \u250f\u2501\u2513"
    line[1] = "  \u2523\u2501\u252b"
    line[2] = "  \u2517\u2501\u251b"
    7.times do
      line[0].insert(3, "\u2501\u2533")
      line[1].insert(3, "\u2501\u254b")
      line[2].insert(3, "\u2501\u253b")
    end
    return line
  end

  def insert_piece(piece, pos)
    str = pos[0].to_s + pos[1].to_s
    @board[str] = piece if not_occupied?(pos)
  end

  def remove_piece(pos)
    str = pos[0].to_s + pos[1].to_s
    @board[str] = nil
  end

  def not_occupied?(str)
    return @board[str] == nil ?  true : false
  end

end