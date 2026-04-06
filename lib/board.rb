class Board
  def initialize
    @board = [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3]
    ]
  end

  def update(move)
    square_to_update = cell(move.cell_number)
    row = square_to_update[:row]
    column = square_to_update[:column]
    player = move.player
    moved = false

    unless board[row][column].is_a?(Player)
      board[row][column] = player
      moved = true
    end

    moved
  end

  def cell(cell_number)
    row, column = nil

    case cell_number
    when 1 then row = 2
                column = 0
    when 2 then row = 2
                column = 1
    when 3 then row = 2
                column = 2
    when 4 then row = 1
                column = 0
    when 5 then row = 1
                column = 1
    when 6 then row = 1
                column = 2
    when 7 then row = 0
                column = 0
    when 8 then row = 0
                column = 1
    when 9 then row = 0
                column = 2
    end

    {
      row: row,
      column: column
    }
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
    " #{board[0][0]} | #{board[0][1]} | #{board[0][2]}\n " \
      "- + - + -\n " \
      "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}\n " \
      "- + - + -\n " \
      "#{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
  end

  private

  attr_reader :board
end
