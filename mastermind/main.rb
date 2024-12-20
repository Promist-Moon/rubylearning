require_relative 'lib/game'
require_relative 'lib/human'
require_relative 'lib/computer'
require_relative 'lib/colours'

game = Game.new
human = Human.new(game)

puts "Welcome to MASTERMIND! Here are the rules: ".tap { STDOUT.flush }
puts "Guess the colour by inputting a number from 1 to 6"
puts "If both colour and position are correct, position will display ✅"
puts "If only colour is correct, position will display ⭕"
puts "If all wrong, position will display ⚫"
puts "----------------------------"

12.times do |row|
  puts "Guess #{row + 1}"

  4.times do |col|
    loop do
      puts "Input guess for position #{col + 1}"
      if human.choose_peg(game, row, col)
        break
      end
    end
  end

  game.check_code(row)

  game.display_board

  if game.win?(human, row)
    puts "----------------------------"
    puts "Congratulations! You've guessed the code!"
    puts "It took #{row + 1} tries."
    puts "----------------------------"
    break
  elsif row == 11
    puts "----------------------------"
    puts "Sorry! No tries left! The code was: "
    game.show_computer_code
    puts "----------------------------"
  end
end