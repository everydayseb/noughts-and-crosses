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
    
    case cell
    when 1 then board[2][0] = player
    when 2 then board[2][1] = player
    when 3 then board[2][2] = player
    when 4 then board[1][0] = player
    when 5 then board[1][1] = player
    when 6 then board[1][2] = player
    when 7 then board[0][0] = player
    when 8 then board[0][1] = player
    when 9 then board[0][2] = player
    end
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