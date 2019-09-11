def minimumTime(numOfSubFiles, files)
    # WRITE YOUR CODE HERE

    # find 2 mins from array
    # add them and puts back to arr
    # calculate result
    result = 0

    (numOfSubFiles - 1).downto(1) do |right|
      first = second = 10**6
      first_i = second_i = 0

      for i in 0..right

        if files[i] < first
          second = first
          first = files[i]
          second_i = first_i
          first_i = i
        elsif files[i] < second
          second = files[i]
          second_i = i
        end
      end

      result += first + second

      files[first_i] = first + second
      files[second_i], files[right] = files[right], files[second_i]
    end
    result
end


# arr1 = [20,4,8,2]
# arr1 = [4,8,6,12]

arr1 = [1,2,5,10,35,89]
arr1 = []
puts minimumTime(arr1.length, arr1)


# 54
[1,2,5,10,35,89]
# 224


# require 'pry'
# Point = Struct.new(:x, :y, :distance)

# def valid?(lot, x, y, numRows, numCols)
#    x >= 0 && x < numRows && y >= 0 && y < numCols && lot[x][y] > 0
# end  

# def traverse(lot, numRows, numCols)
#   distance = 0

#   q = Queue.new
#   q.enq( Point.new(0,0,distance) )

#   while(!q.empty?)
#     node = q.deq
#     x, y = node.x, node.y
#     distance = node.distance
#     return distance if lot[x][y] == 9
#     lot[0][0] = 1

#     # right
#     if valid?(lot, x, y+1, numRows, numCols)
#       q.enq( Point.new(x, y+1, distance+1) )
#     end

#     # down
#     if valid?(lot, x+1, y, numRows, numCols)
#       q.enq( Point.new(x+1, y, distance+1) )
#     end

#     # left
#     if valid?(lot, x, y-1, numRows, numCols)
#       q.enq( Point.new(x, y-1, distance+1) )
#     end

#     # up
#     if valid?(lot, x-1, y, numRows, numCols)
#       q.enq( Point.new(x-1, y, distance+1) )
#     end
#   end
#   -1
# end

# numRows = 3
# numCols = 3
# lot = [[1,1,1], [1,0,1], [1,9,1]]
# puts traverse(lot, numRows, numCols)  