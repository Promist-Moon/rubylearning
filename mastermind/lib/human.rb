# human player
require_relative 'colours'

class Human
  def initialize(game)
    @game = game
  end

  def choose_peg(game, row, col)
    puts "Player, choose a colour from the below colours: "
    6.times do |i|
      puts "Input #{i + 1} for #{Colours::COLOURS[i + 1]}"
    end
    input = gets.chomp.to_i

    if (1..6).cover?(input)
      game.set_peg(row, col, Colours::COLOURS[input.to_i]) 
      return true
    else 
      puts "Input must be an integer between 1 to 6 inclusive!"
    end
  end

  def valid_integer?(input)
    Integer(input.to_i) rescue false
  end
end