require_relative 'engine.rb'

game = Engine.new
game_stop = false
game.start_game
until game_stop
  game.display
  game.one_round
  puts "ONE ROUND DONE"
  game_stop = game.game_over

puts "Game Over"
end