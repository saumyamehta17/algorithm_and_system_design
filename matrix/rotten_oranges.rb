class RottenOranges
  attr_reader :arr, :m , :n, :time_frame

  def initialize(arr,m,n)
    @arr, @m, @n = arr,m,n
    @time_frame = 0
  end

  def find
    q = Queue.new
    for i in 0...m
      for j in 0...n
        if arr[i][j] == 2
          q.enq(Point.new(i,j))
        end  
      end
    end

    q.enq(Point.new(-1,-1))

    while(!q.empty?)
      node = q.deq
      while(is_not_delimiter(node))
        i = node.i
        j = node.j

        if valid(i-1, j)
          arr[i-1][j] = 2
          q.enq(Point.new(i-1, j))
        end
        
        if valid(i+1, j)
          arr[i+1][j] = 2
          q.enq(Point.new(i+1, j))
        end

        if valid(i, j-1)
          arr[i][j-1] = 2
          q.enq(Point.new(i, j-1))
        end

        if valid(i, j+1)
          arr[i][j+1] = 2
          q.enq(Point.new(i, j+1))
        end  
        node = q.deq
      end
      @time_frame += 1
      if !q.empty?
        q.enq(Point.new(-1,-1))
      end  
    end

    for i in 0...m
      for j in 0...n
        if arr[i][j] == 1
          @time_frame = -1
          return
        end  
      end
    end    
  end

  def valid(i,j)
    i < m && i >= 0 && j >= 0 && j < n && arr[i][j] == 1
  end  

  def is_not_delimiter(node)
    node.i != -1 && node.j != -1
  end

end  

Point = Struct.new(:i,:j)

arr = [ [2, 1, 0, 2, 1],
        [1, 0, 1, 2, 1],
        [1, 0, 0, 2, 1]
      ]
m = 3
n = 5
r = RottenOranges.new(arr, m , n)        
r.find
puts r.time_frame