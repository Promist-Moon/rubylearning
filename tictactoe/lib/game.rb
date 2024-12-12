class Game

  def initialize
    @board = Array.new(3) { Array.new(3, 0) }
  end

  def display_board
    @board.each do |row|
      puts row.map { |cell| cell == 0 ? ' ' : cell }.join(' | ')
      puts '--+---+--'
    end
  end

  WINNING_MOVES = [
    [[0, 0], [0, 1], [0, 2]],  # Row 1
    [[1, 0], [1, 1], [1, 2]],  # Row 2
    [[2, 0], [2, 1], [2, 2]],  # Row 3
    [[0, 0], [1, 0], [2, 0]],  # Col 1
    [[0, 1], [1, 1], [2, 1]],  # Col 2
    [[0, 2], [1, 2], [2, 2]],  # Col 3
    [[0, 0], [1, 1], [2, 2]],  # Diagonal \
    [[0, 2], [1, 1], [2, 0]]   # Diagonal /
  ]


  def make_move(player)
    row, col = nil, nil
    loop do
      puts "Player #{player.symbol}, select your row."
      input_row = gets.chomp
      puts "Player #{player.symbol}, select your column"
      input_col = gets.chomp

      if input_row.empty? || input_col.empty?
        puts "Input cannot be empty! Try again."
        next
      elsif !input_row.match?(/^\d+$/) || !input_col.match?(/^\d+$/)
        puts "Input must be numeric! Try again."
        next
      end

      row = input_row.to_i
      col = input_col.to_i

      if valid_move?(row, col)
        @board[row][col] = player.symbol
        return true
      elsif !row.is_a?(Integer) || !row.is_a?(Integer) || !(0..2).cover?(row) || !(0..2).cover?(col)
        puts "Input must be an integer between 0 and 2 only!"
      elsif @board[row][col] != 0
        puts "Position taken! Select new place!"
      else
        puts "Invalid input! Try again."
      end
    end
  end

  def valid_move?(row, col)
    (0..2).cover?(row) && (0..2).cover?(col) && @board[row][col] == 0
  end

  def draw?(player)
    if win?(player)
      false
    else 
      @board.flatten.none?(0)
    end
  end

  def win?(player)
    WINNING_MOVES.any? do |check|
      check.all? do |pos|
        @board[pos[0]][pos[1]] == player.symbol
      end
    end
  end
end