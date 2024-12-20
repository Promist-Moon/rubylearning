require_relative 'colours'

class Game
  def initialize
    @code = Computer.new
    @code.generate_code
    @board = Array.new(12) { Array.new(8, 0) }
  end

  def show_computer_code
    puts "Computer's secret code: #{@code.code.join(', ')}"
  end

  def display_board
    non_empty_rows = @board.reject { |row| row.all? { |cell| cell == 0 } }

    non_empty_rows.each do |row|
      puts row.map { |cell| cell == 0 ? ' ' : cell }.join(' | ')
      puts '--+---+---+--'
    end
  end

  def set_peg(row, col, value)
    @board[row][col] = value
  end

  def check_code(row)
    code_copy = @code.code.map { |peg| peg }
    guess_copy = @board[row][0..3].map { |peg| peg }

    4.times do |i|
      if guess_copy[i] == code_copy[i]
        @board[row][i + 4] = "✅"
        code_copy[i] = nil
        guess_copy[i] = nil
      end
    end

    4.times do |i|
      next if guess_copy[i] == nil  # Skip already processed positions
  
      if code_copy.include?(guess_copy[i])
        @board[row][i + 4] = "⭕"
        code_copy[code_copy.index(guess_copy[i])] = nil  # Nullify the matched code
      else
        @board[row][i + 4] = "⚫"
      end
    end
  end

  def win?(player, row)
    @board[row][4..7].all? { |peg| peg == "✅"}
  end
end