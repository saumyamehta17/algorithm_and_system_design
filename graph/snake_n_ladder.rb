Node = Struct.new(:vrtx, :dist)
class SnakeLadder
  attr_accessor :board, :moves, :m, :n

  def initialize(m, n)
    @m = m
    @n = n
    @board = Array.new(m) {Array.new(n)}
    @moves = Array.new(m*n, -1)
  end

  def set_moves

    # Ladders
    @moves[2] = 21
    @moves[4] = 7
    @moves[10] = 25
    @moves[19] = 28
    # Snakes
    @moves[26] = 0
    @moves[20] = 8
    @moves[16] = 3
    @moves[18] = 6
  end

  def find_min_distance
    q = Queue.new
    node = Node.new
    node.vrtx = 0
    node.dist = 0 
    q.enq(node)
    visited = Array.new(m*n, 0)
    visited[0] = 1

    while(!q.empty?)
      node = q.deq
      if node.vrtx == (m*n - 1)
        puts node.dist
        break
      end  

      for i in (node.vrtx + 1)..(node.vrtx+6)
        break if i == m*n
        if visited[i] == 0
          nn = Node.new
          nn.dist = node.dist + 1

          if moves[i] != -1
            nn.vrtx = moves[i]
          else
            nn.vrtx = i
          end
          visited[i] = 1
          q.enq(nn)  
        end  
      end  
    end  
      
  end  
end  

sl = SnakeLadder.new(5,6)
sl.set_moves
sl.find_min_distance
