class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def diagonals
    diagonals = []
    diagonals.push([@grid[0][0], @grid[1][1], @grid[2][2]])
    diagonals.push([@grid[0][2], @grid[1][1], @grid[2][0]])
    diagonals
  end

  def rows
    rows = []
    @grid.each do |row|
      rows.push(row)
    end
    rows
  end

  def columns
    columns = []
    columns.push([@grid[0][0], @grid[1][0], @grid[2][0]])
    columns.push([@grid[0][1], @grid[1][1], @grid[2][1]])
    columns.push([@grid[0][2], @grid[1][2], @grid[2][2]])
    columns
  end

  def place_mark(pos, mark)
    @grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == nil
  end

  def display
    @grid.each do |row|
      puts "#{row[0]} | #{row[1]} | #{row[2]}"
    end
  end

  def won?(mark)
    if rows.any? { |row| row.all? { |el| el == mark } }
      return true
    elsif diagonals.any? { |diag| diag.all? { |el| el == mark } }
      return true
    elsif columns.any? { |col| col.all? { |el| el == mark } }
      return true
    else
      false
    end
  end

  def tied?
    (0..2).each do |i|
      (0..2).each do |j|
        return false if empty?([i, j])
      end
    end
  end

end


class HumanPlayer

  attr_reader :name

  def initialize
    print "Please enter your name: "
    @name = gets.chomp
  end

  def move(board, mark)
    puts "#{name}, It's your turn, make your move!"
    p1_input  = gets.chomp.split(",").map { |el| el.to_i - 1 }
    if !p1_input.all? { |el| el.between?(0, 2) } || !board.empty?(p1_input)
      puts "Invalid move! Please make a legal move"
      move(board)
    else
      board.place_mark(p1_input, mark)
    end
  end

end

class ComputerPlayer

  attr_reader :name

  def initialize
    print "Please enter a name for CPU: "
    @name = gets.chomp
  end

  def move(board, mark)
    puts "Its CPU's turn"
    available = []
    (0..2).each do |i|
      (0..2).each do |j|
        available.push([i, j]) if board.empty?([i, j])
      end
    end
    p2_input = available.sample
    board.place_mark(p2_input, mark)
  end
end

class Game

  attr_reader :board, :player_1, :player_2

  def initialize
    puts "Welcome to TicTacToe!
          What kind of game do you want?
          Enter 1 for Human vs. CPU.
          Enter 2 for Human vs. Human.
          Enter 3 for CPU vs. CPU"
    choice = gets.chomp.to_i
    if choice == 1
       @player_1 = HumanPlayer.new
       @player_2 = ComputerPlayer.new
    elsif choice == 2
      @player_1 = HumanPlayer.new
      @player_2 = HumanPlayer.new
    elsif choice == 3
      @player_1 = ComputerPlayer.new
      @player_2 = ComputerPlayer.new
    else
      puts "Invalid choice, please enter between 1 - 3"
      initialize
    end
    @board = Board.new
  end

  def play
    puts "Please enter in a row number(1-3) and column number(1-3). E.g. 2, 3"
    board.display

    until board.won?("O") || board.tied? do
      player_1.move(board, "X")
      board.display
      break if board.won?("X") || board.tied?
      player_2.move(board, "O")
      board.display
    end

    if board.won?("X")
      puts "#{player_1.name} won!" if board.won?("X")
    elsif board.won?("O")
      puts "#{player_2.name} won!" if board.won?("O")
    elsif board.tied?
      puts "Game tied!"
    else
      puts "Something went wrong!"
    end
  end
end

game = Game.new
game.play
