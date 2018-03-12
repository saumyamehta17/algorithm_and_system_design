Point = Struct.new(:x, :y)
class RotOranges
  attr_accessor :arr, :m, :n, :time_frame

  def initialize(arr, m, n)
    @arr = arr
    @m = m
    @n = n
    @time_frame = 0
  end

  def find
    q = Queue.new
    i = 0;
    while(i < m)
      j = 0
      while( j < n)
        if arr[i][j] == 2
          q.enq(Point.new(i,j))
        end  
        j += 1
      end
      i += 1
    end
    q.enq(Point.new(-1,-1))
    
    while(!q.empty?)
      flag = false
      point = q.deq
      while(!delimiter?(point))
        # puts point
        if    is_valid?(point.x, point.y-1)
          if !flag
            flag = true; @time_frame += 1
          end  
          arr[point.x][point.y-1] = 2
          q.enq(Point.new(point.x, point.y-1))
        end
          
        if is_valid?(point.x, point.y+1)
          if !flag
            flag = true; @time_frame += 1
          end  
          arr[point.x][point.y+1] = 2
          q.enq(Point.new(point.x, point.y+1))
        end

        if is_valid?(point.x-1, point.y)
          if !flag
            flag = true; @time_frame += 1
          end  
          arr[point.x-1][point.y] = 2
          q.enq(Point.new(point.x-1, point.y))
        end

        if is_valid?(point.x+1, point.y)
          if !flag
            flag = true; @time_frame += 1
          end  
          arr[point.x+1][point.y] = 2
          q.enq(Point.new(point.x+1, point.y))
        end  
        point = q.deq               
      end
      if(!q.empty?)  
        q.enq(Point.new(-1,-1))
      end  
    end  
  end

  def delimiter?(point)
    point.x == -1 && point.y == -1
  end

  def is_valid?(x,y)
    (0...m) === x && 
    (0...n) === y && 
    arr[x][y] == 1
  end  

  
end  
arr = [ [2, 1, 0, 2, 1],
        [1, 0, 1, 2, 1],
        [1, 0, 0, 2, 1]
      ]
obj = RotOranges.new(arr, 3, 5)
obj.find
puts obj.time_frame