# Flood fill Algorithm
require 'pry'
class FloodFill
  attr_accessor :prev_color, :matrix, :m, :n, :new_color

  def initialize(new_color)
    @m = 7
    @n = 7
    @new_color = new_color
    @matrix = [
              [1, 1, 1, 1, 1, 1, 1, 1],
              [1, 1, 1, 1, 1, 1, 0, 0],
              [1, 0, 0, 1, 1, 0, 1, 1],
              [1, 2, 2, 2, 2, 0, 1, 0],
              [1, 1, 1, 2, 2, 0, 1, 0],
              [1, 1, 1, 2, 2, 2, 2, 0],
              [1, 1, 1, 1, 1, 2, 1, 1],
              [1, 1, 1, 1, 1, 2, 2, 1]
              ]
  end

  def self.start(x,y,new_color)
    obj = FloodFill.new(new_color)
    obj.prev_color = obj.matrix[x][y]
    obj.flood_fill(x,y)
    obj.print_it
  end 

  def flood_fill(x,y)
    return if x > m || x < 0 || y > n || y < 0
    if(matrix[x][y] == prev_color)
      matrix[x][y] = new_color
      flood_fill(x+1, y)
      flood_fill(x-1, y)
      flood_fill(x, y+1)
      flood_fill(x, y-1)
    end  
  end  

  def print_it
    print matrix
  end  
end  

FloodFill.start(4,4,3)