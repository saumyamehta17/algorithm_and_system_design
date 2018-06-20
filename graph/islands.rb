class Graph
  attr_reader :mtrx, :visited_mtrx, :vertices, 
              :row_possible_indx, :col_possible_indx

  def initialize
    @vertices = 5
    @mtrx =  [[1, 1, 0, 0, 0],
              [0, 1, 0, 0, 1],
              [1, 0, 0, 1, 1],
              [0, 0, 0, 0, 0],
              [1, 0, 1, 0, 1]]
    @visited_mtrx = Array.new(vertices) {Array.new(vertices, false)}    
    @row_possible_indx = [0,0,-1,-1,-1,1,1,1]
    @col_possible_indx = [-1,1,0,-1,1,0,-1,1]
  end

  def num_of_islands
    count = 0
    for row in 0...vertices
      for col in 0...vertices

        if mtrx[row][col] == 1 && !visited_mtrx[row][col]
          explore(row, col)
          count += 1
        end
        
      end
    end

    puts "Total no of islands #{count}"    
  end


  def explore(row, col)
    @visited_mtrx[row][col] = true

    8.times do |i|

      if safe?(row + row_possible_indx[i], col + col_possible_indx[i])
        explore(row + row_possible_indx[i], col + col_possible_indx[i])
      end  
    end  
  end 

  def safe?(row, col)

    return row >= 0 && col >= 0 &&
           row < vertices && col < vertices &&
           mtrx[row][col] == 1 &&
           !visited_mtrx[row][col]

  end 

end 

gh = Graph.new 
gh.num_of_islands