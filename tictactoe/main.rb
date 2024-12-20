require_relative 'lib/game'
require_relative 'lib/player'

# Now you can use the Game and Player classes
game = Game.new
player_1 = Player.new(game, 'X')
player_2 = Player.new(game, 'O')

current_player = player_1

puts "Welcome to the game!".tap { STDOUT.flush }

loop do
  game.display_board
  puts "Player #{current_player.symbol}'s turn"

  if current_player.select_pos
    if game.win?(current_player)
      game.display_board
      puts "-------------"
      puts "Player #{current_player.symbol} wins!"
      puts "-------------"
      break
    elsif game.draw?(current_player)
      game.display_board
      puts "-------------"
      puts "Board full: draw!"
      puts "-------------"
      break
    else
      current_player = current_player == player_1 ? player_2 : player_1
    end 
  end
end