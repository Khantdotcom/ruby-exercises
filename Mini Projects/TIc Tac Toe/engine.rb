# # frozen_string_literal: true

# class Engine
#   attr_accessor :board, :turn
#   def initialize
#     @board = Array.new(3) {Array.new(3,'---')}
#     @turn = 'X'
#     @player = nil
#   end
    
#   def start_game
#     puts "WELCOME TO XOXO GAME!!!"
#     puts "TYPE coordinates of tic tac toe!"
#   end

#   def take_turns
#     until @board[(@player[0].to_i) - 1][(@player[1].to_i) -1] == '---'
#       puts "INVALID MOVE"
#       player_input
#     end
#     @board[(@player[0].to_i) - 1][(@player[1].to_i) -1] = @turn 
#     @turn = 'Y'
#     display
#   end

#   def player_input
#     puts "Your Turn - "
#     player = gets.chomp.to_s
#     until player.match?(/\A[123]{2}\z/)
#       puts "Your input is not valid"
#       player = gets.chomp.to_s
#     end
#     @player = player
#     take_turns
#   end

#   def one_round
#     2.times {player_input}
#     @turn = 'X'
#   end

#   def display
#     @board.each{|x| p x}
#   end

#   def row_check(array)
#     array.any? do |row|
#       row.join.match? (/(XXX|YYY)/)
#     end
#   end

#   def right_diagonal(array)
#     p (0...array.size).map{|i| array[i][i]}
#     array.match? (/(XXX|YYY)/)
#     # count = 0
#     # diagonal_match = array.map do |row|
#     #   rotated = row.rotate(count)
#     #   count += 1
#     #   rotated
#     # end
#     # p diagonal_match
#   end

#   def left_diagonal(array)
#     # count = 2
#     # diagonal_match = array.map do |row|
#     #   rotated = row.rotate(count)
#     #   count -= 1
#     #   rotated
#     # end
#     # p diagonal_match
#     p (0...array.size).map{|i| array[i][-i-1]}
#     array.match? (/(XXX|YYY)/)
#   end

#   def diagonal(array)
#     p right_diagonal(array) || left_diagonal(array)
#   end

#   def game_over
#     p row_check(@board) || row_check(@board.transpose) || diagonal(@board)
# end
# end


# array = Array.new(3) {Array.new(3,'X')}



# new = Engine.new

# p new.row_check([[4, 4, 4], [3, 7, 6], [2, 9, 5]])

class Engine
  attr_accessor :board, :turn

  def initialize
    @board = Array.new(3) { Array.new(3, '---') }
    @turn = 'X'
    @player = nil
  end
    
  def start_game
    puts "WELCOME TO XOXO GAME!!!"
    puts "TYPE coordinates of tic tac toe!"
  end

  def take_turns
    until @board[(@player[0].to_i) - 1][(@player[1].to_i) - 1] == '---'
      puts "INVALID MOVE"
      player_input
    end
    @board[(@player[0].to_i) - 1][(@player[1].to_i) - 1] = @turn 
    @turn = (@turn == 'X') ? 'Y' : 'X'
    display
  end

  def player_input
    puts "Your Turn - "
    player = gets.chomp.to_s
    until player.match?(/\A[123]{2}\z/)
      puts "Your input is not valid"
      player = gets.chomp.to_s
    end
    @player = player
    take_turns
  end

  def one_round
    2.times { player_input }
  end

  def display
    @board.each { |x| p x }
  end

  def row_check(array)
    array.any? do |row|
      row.join.match?(/(XXX|YYY)/)
    end
  end

  def right_diagonal(array)
    (0...array.size).map { |i| array[i][i] }
  end

  def left_diagonal(array)
    (0...array.size).map { |i| array[i][-i-1] }
  end

  def diagonal(array)
    right = right_diagonal(array)
    left = left_diagonal(array)
    row_check([right]) || row_check([left])
  end

  def game_over
    p row_check(@board) || row_check(@board.transpose) || diagonal(@board)
  end
end

p ['X','','X'].uniq.size