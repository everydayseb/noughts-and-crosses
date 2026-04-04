class Board
  def initialize
    @board = [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3],
    ]
  end

  def update(move)
    cell = move.cell_number
    player = move.player
    moved = false
    
    case cell
    when 1
      unless board[2][0].is_a?(Player)
        board[2][0] = player
        moved = true
      end
    when 2 
      unless board[2][1].is_a?(Player) 
        board[2][1] = player
        moved = true
      end
    when 3 
      unless board[2][2].is_a?(Player)
        board[2][2] = player
        moved = true
      end
    when 4 
      unless board[1][0].is_a?(Player)
        board[1][0] = player
        moved = true
      end
    when 5 
      unless board[1][1].is_a?(Player)
      board[1][1] = player
        moved = true
      end
    when 6 
      unless board[1][2].is_a?(Player)
        board[1][2] = player
        moved = true
      end
    when 7 
      unless board[0][0].is_a?(Player)
        board[0][0] = player
        moved = true
      end
    when 8 
      unless board[0][1].is_a?(Player)
        board[0][1] = player
        moved = true
      end
    when 9 
      unless board[0][2].is_a?(Player)
        board[0][2] = player
        moved = true
      end
    end

    moved
  end

  def full?
    board.flatten.all?(Player)
  end

  def check_rows
    winner = nil
    board.each do |row|
      winner = row[0] if row.all?(row[0])
    end

    winner
  end

  def check_columns
    winner = nil
    
    if board[0][0] == board[1][0] && board[0][0] == board[2][0]
      winner = board[0][0]
    elsif board[0][1] == board[1][1] && board[0][1] == board[2][1]
      winner = board[0][1]
    elsif board[0][2] == board[1][2] && board[0][2] == board[2][2]
      winner = board[0][2]
    end

    winner
  end

  def check_diagonals
    winner = nil

    if board[0][0] == board[1][1] && board[0][0] == board[2][2]
      winner = board[0][0]
    elsif board[0][2] == board[1][1] && board[0][2] == board[2][0]
      winner = board[0][2]
    end

    winner
  end

  def winner
    check_rows || check_columns || check_diagonals
  end

  def to_s
    " #{board[0][0]} | #{board[0][1]} | #{board[0][2]}\n" +
    " - + - + -\n" +
    " #{board[1][0]} | #{board[1][1]} | #{board[1][2]}\n" +
    " - + - + -\n" +
    " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
  end

  private

  attr_reader :board
end