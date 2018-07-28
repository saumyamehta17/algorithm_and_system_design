# time complexity is o(rxc)
class RatInMaze
    attr_reader :maze, :n, :paths

    def initialize(maze, n)
        @maze = maze
        @n = n
        @paths = []
    end

    def util(i = 0, j = 0, l = '', direction = '')
        # base condition
        if i == n-1 && j == n-1
            l += direction
            @paths << l
            # return true
        end 

        if safe?(i,j)
            l += direction

            # Right Direction
            puts "right = #{i}, #{j+1}"
            if util(i, j+1, l, 'R')
                return true
            end
            
            # Down Direction
            puts "down #{i+1}, #{j}"
            if util(i+1, j, l, 'D')
                return true
            end 

            l.chop
            return false   
        end
        return false   

    end    

    def safe?(i,j)
        val = i <= n-1 && j <= n-1 && maze[i][j] == 1
        # puts "#{i}, #{j} - #{val} #{maze[i][j]}"
        val
    end    
end   

n = 4
# maze = [[1, 0, 0, 0],
#         [1, 1, 0, 1],
#         [0, 1, 0, 0],
#         [1, 1, 1, 1]]

maze = [[1, 0, 0, 0],
        [1, 1, 0, 1],
        [1  , 1, 0, 0],
        [0, 1, 1, 1]
       ]        
obj = RatInMaze.new(maze,n)
obj.util
puts obj.paths.to_s