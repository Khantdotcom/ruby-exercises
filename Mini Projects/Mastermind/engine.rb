require 'colorize'

class Mastermind
  attr_accessor :history, :turn

def initialize

  @color = ['red','blue','yellow','green','black','white','cyan', 'magenta']

  @computer_guess = @color.shuffle[0..3]

  @history = Hash.new

  @turn = 1
end

def start_game
  puts "\n\nWelcome to Mastermind! \n\n".colorize(:color => :cyan, :mode => :bold).blink
  puts "Secret Code - |_____|_____|_____|_____| \n\n".colorize(:color => :blue, :mode => :bold)
  @color.each {|x| print x.colorize(:color => x.to_sym, :mode => :bold) + ' | '}
  puts "\nType your guesses\nDO NOTE THAT ORDER MATTER!\n\n"
end

def player_input
  puts "\nYour guess for color NO. 1?\n".colorize(:color => :green)
  @guess_1 = gets.chomp.to_s

  puts " \nYour guess for color NO. 2?\n".colorize(:color => :green)
  @guess_2 = gets.chomp.to_s

  puts " \nYour guess for color NO. 3?\n".colorize(:color => :green)
  @guess_3 = gets.chomp.to_s

  puts " \nYour guess for color NO. 4?\n".colorize(:color => :green)
  @guess_4 = gets.chomp.to_s

  board = Array.new(0) {Array.new(0)}
  board.append([@guess_1.downcase,@guess_2.downcase,@guess_3.downcase,@guess_4.downcase])

  # p board

  @history[@turn] = board
  # p @history
  # p @computer_guess

end

def display
  @history.each do |turn, value|
    value[0].each{|x| print x.colorize(:color => x.to_sym, :mode => :bold) + ' | '}
    puts value[1].to_s + " | " + value[2].to_s
  end
end

def check_secret_code
  not_exact = 0
  exact = 0 
  @history[@turn][0].select.with_index do |x,index|
    if @computer_guess[index] == x
        exact += 1
    elsif @computer_guess.include?(x)
      not_exact += 1
    end
  end
  @history[@turn][1] = exact
  @history[@turn][2] = not_exact
  puts "\nTurn - #{@turn} / 10\nExact Match = #{exact} | Not_exact_Match = #{not_exact}".colorize(:color => :blue)
end

def game_over
  if @history[@turn][1] == 4
    puts "\n \n -------------YOU WON THE GAME!!!!!!!!!------------------\n\n"
    false
  elsif @turn == 10
    puts "\n \n -------------LOL WHAT A LOSER!!!!!!!!!------------------\n\n"
    false
  else
    true
  end
end

def ending 
  puts "Secret Code - |_____|_____|_____|_____| \n\n".colorize(:color => :blue, :mode => :bold)
  puts @computer_guess.each {|x| print x.colorize(:color => x.to_sym, :mode => :bold) + ' | '}
end

end
# turn = 3
# board = Array.new(0) {Array.new(0)}
# nn = Hash.new

# nn[turn] = board.append([turn])
# nn[turn][1] = 'jj'
# nn[turn][2] = 'pp'
# p nn
# guess = [2,4,3,5]

# p match_num.size
# p not_exact
# p exact

##goal - in two string, match if they're exactly the same, any exact position, any char >> output same num , exact num]

# color = ['red','blue','yellow','green']
# input = '.*${}.*|.*green.*|.*blue.*'
# test = Regexp.new()
# puts test = Regexp.new(color.join)

# puts /.*red.*|.*green.*|.*blue.*/.match?('redgreenbluemagnet')

# puts //.class

# history = Hash.new(0)
# history[2] = [['red','green','white'],'5']
# history.each do |turn, value|
#   value[0].each{|x| print x.colorize(:color => x.to_sym, :mode => :bold) + ' | '}
#   puts value[1]
#   puts value[2]
# end