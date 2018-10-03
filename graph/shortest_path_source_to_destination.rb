

require 'pry'
class SourceToDestPath
  attr_reader :x, :y, :m, :n, :mtrx

  def initialize(x,y,m,n,mtrx)
    @x, @y, @m, @n, @mtrx = x,y,m,n,mtrx
    puts mtrx.to_s
  end

  def find_path(curr_x = 0, curr_y = 0 , _step = 0)
    return 100 if !valid?(curr_x, curr_y)

    if curr_x == x && curr_y == y
      return _step
    end

    # puts "#{curr_x}, #{curr_y}, #{_step}"
    

    # if curr_x >= m || curr_y >= n
    #   return -1
    # end  


    return [
    find_path(curr_x+1, curr_y, _step+1),
    find_path(curr_x, curr_y+1, _step+1)].min

  end  

  def valid?(i,j)
    i >= 0 && j >= 0 && i < m && j < n && mtrx[i][j] == 1
  end 
end  


x = 2
y = 3
m = 3
n = 4
mtrx = [[1, 0, 0, 0],[1, 1, 0, 1],[0, 1, 1, 1]]
mtrx = [[1,1,1,1,], [0,0,0,1], [0,0,0,1]]
x = 0
y = 3
obj = SourceToDestPath.new(x, y, m, n, mtrx)
puts obj.find_path


# using Queue
Node = Struct.new(:x, :y, :dst)

def stod(mtrx, x, y, m, n, src_x, src_y)
  row_arr = [-1, 1, 0, 0]
  col_arr = [0, 0, -1, 1]
  visited = Array.new(m) { Array.new(n, false) }
  queue = Queue.new
  queue.enq( Node.new(src_x, src_y, 0) )
  while !queue.empty?
    curr = queue.deq
    if curr.x == x && curr.y == y
      return curr.dst
    end

    for i in 0...4
      x1 = curr.x + row_arr[i]
      y1 = curr.y + col_arr[i]
      if valid?(x1, y1, mtrx, m, n, visited)
        visited[x1][y1] = true
        queue.enq( Node.new(x1, y1, curr.dst + 1) )
      end  
    end  
  end
  -1
end  

def valid?(x, y, mtrx, m, n, visited)
  x >= 0 && x < m && y >= 0 && y < n && mtrx[x][y] == 1 && visited[x][y] == false
end  

x = 2
y = 3
m = 3
n = 4
mtrx = [[1, 0, 0, 0],[1, 1, 0, 1],[0, 1, 1, 1]]
puts stod(mtrx, x, y, m, n, 0, 0)