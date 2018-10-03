require 'pry'
class Board
  attr_accessor :m, :n, :locations

  def initialize(m,n)
    @m = m
    @n = n
    @locations = Array.new(m) {Array.new(n, 0)}
  end

  def setup
    counter = 0
    m.times do |i|
      n.times do |j|
        counter += 1
        @locations[i][j] = Location.new(i,j, counter)
      end
    end    
  end

  def add_move(x,y,val)
    @locations[x][y].value = val
  end  
end 

class Location
  attr_accessor :x, :y, :value

  def initialize(x, y, value=nil)
    @x = x
    @y = y
    @value = value
  end
end

class Dice
  attr_accessor :values

  def initialize
    @values = 1..6
  end

  def throw
    rand(values)
  end  
end

class Player
  attr_accessor :name, :x, :y

  def initialize(name)
    @name = name
    @x = 0
    @y = 0
  end

  def play(board, dice)
    puts "Please play your turn #{name}"
    val = dice.throw
    puts "Board has #{board.locations[x][y].value} at #{x} and #{y}"
    puts "You are at #{board.locations[x][y].value} and dice throws #{val} steps taking you to the " 
    move
  end

  def move
    
  end  
end

class Game
  attr_accessor :players, :board, :dice, :turn_counter

  def initialize
    @players = []
    @turn_counter = 0
  end

  def setup_players
    2.times do |i|
      players[i] = Player.new("sm#{i}")
    end
  end

  def setup_board
    @board = Board.new(3,4)
    board.setup
    puts board.locations.to_s
  end  

  def setup_dice
    @dice = Dice.new
  end  

  def start
    while(1)
      player = players[turn_counter % players.count]
      @turn_counter += 1
      player.play(board, dice)
      user_input = gets.chomp.to_i
      puts "Press 1 to end the Game else will continues."
      if user_input.to_i == 1
        puts "Ending the Game...."
        break
      end  
    end
  end  

  def self.start
    game = Game.new
    game.setup_players
    game.setup_board
    game.setup_dice
    game.start
  end  
end 

Game.start 




# improved
# require 'pry'
# def solution(a, b)
#    multiplicative_count = 0
#    a.length.times do |i|
#      a[i] = a[i] + (b[i] / 1_000_000.0)
#    end
#    a = [0.5, 1.5, 2.0, 2.0, 3.0, 5.02]

#    i = 0
#    while(i < a.length - 1)
#     j = i
#     while(j < a.length - 1)
#       if (a[i] * a[j+1]) >= a[i] + a[j+1]
#         puts "#{i}, #{j+1}, result #{(a[i] * a[j+1])} >= #{a[i] + a[j+1]}"
#         multiplicative_count += (a.length - 1 - j)
#         break
#       end  
#       j += 1
#     end 
#     return if multiplicative_count > 100_00_00_000
#     i += 1
#    end 
#    return multiplicative_count
# end

# a = [0, 1, 2, 3, 4, 5]
# b = [500_000, 500_000, 0, 0, 0, 20_000]
# puts solution(a,b)

# first try
# require 'pry'
# def solution(a, b)
#    multiplicative_count = 0
#    a.length.times do |i|
#      a[i] = a[i] + (b[i] / 1_000_000.0)
#    end
#    a = [0.5, 1.5, 2.0, 2.0, 3.0, 5.02]

#    i = 0
#    while(i < a.length - 1)
#     j = i
#     while(j < a.length - 1)
#       if (a[i] * a[j+1]) >= a[i] + a[j+1]
#         multiplicative_count += 1
#       end  
#       j += 1
#     end 
#     return if multiplicative_count > 100_00_00_000
#     i += 1
#    end 
#    return multiplicative_count
# end

# a = [0, 1, 2, 3, 4, 5]
# b = [500_000, 500_000, 0, 0, 0, 20_000]
# puts solution(a,b)