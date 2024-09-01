require_relative 'engine.rb'

game = Mastermind.new
game_on = true
game.start_game

while game_on
  game.player_input
  game.check_secret_code
  game.display
  game_on = game.game_over
  game.turn += 1
end

game.ending