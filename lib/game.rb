class Game
  attr_reader :board, :player_x, :player_o, :player_to_move

  def initialize
    @board = Board.new
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @player_to_move = player_x
  end

  def switch_player
    @player_to_move = player_to_move == player_x ? player_o : player_x
  end

  def run
    while true
      system("clear")
      puts board
      puts "It is #{player_to_move}'s turn."
      print "Choose a square: "
      input = gets.chomp
      break if input.upcase == 'Q'
      move = Move.new(input, player_to_move)
      board.update(move)
      winner = board.winner
      if winner
        system("clear")
        puts board
        puts "#{winner} won the game!"
        break
      end
      switch_player
    end
  end
end