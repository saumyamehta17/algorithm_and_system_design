

# require 'pry'
# class SourceToDestPath
#   attr_reader :x, :y, :m, :n, :mtrx

#   def initialize(x,y,m,n,mtrx)
#     @x, @y, @m, @n, @mtrx = x,y,m,n,mtrx
#   end

#   def find_path(curr_x = 0, curr_y = 0 , _step = 0)
#     return 100 if !valid?(curr_x, curr_y)

#     if curr_x == x && curr_y == y
#       return _step
#     end

#     puts "#{curr_x}, #{curr_y}, #{_step}"
    

#     if curr_x >= m || curr_y >= n
#       return -1
#     end  


#     return [
#     find_path(curr_x+1, curr_y, _step+1),
#     find_path(curr_x, curr_y+1, _step+1)].min

#   end  

#   def valid?(i,j)
#     i >= 0 && j >= 0 && i < m && j < n && mtrx[i][j] == 1
#   end 
# end  


# x = 2
# y = 3
# m = 3
# n = 4
# mtrx = [[1, 0, 0, 0],[1, 1, 0, 1],[0, 1, 1, 1]]
# obj = SourceToDestPath.new(x, y, m, n, mtrx)
# puts obj.find_path