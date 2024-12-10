class Player
  def initialize(game, symbol)
    @game = game
    @symbol = symbol
  end

  attr_reader :symbol

  def select_pos
    if @game.make_move(self)
      true
    else
      false
    end
  end
end