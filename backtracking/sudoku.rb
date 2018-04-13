class SudokuGame
  attr_reader :row, :col, :num, :arr

  def initialize(arr)
    @arr = arr
    @num = 9
    @row = 0
    @col = 0
  end

  def solve_it

    if !have_more_location
      return true
    end 
    l_row = row
    l_col = col
    i = 1
    while(i <= num) 

      if is_safe(i)

          @arr[l_row][l_col] = i

          if solve_it
            return true
          end
          puts "#{l_row} - #{l_col}"
          @arr[l_row][l_col] = 0
      end
      i += 1
    end  
    false
  end

  def is_safe(i)
   return !not_in_curr_row(i) && 
          !not_in_curr_col(i) && 
          !not_in_curr_box(i, row - row%3, col - col%3)
  end  

  def not_in_curr_row(val)
    i = 0
    while(i < num)
      if arr[row][i] == val
        return true
      end  
      i += 1
    end
    false  
  end

  def not_in_curr_col(val)
    i = 0
    while(i < num)
      if(arr[i][col] == val)
        return true
      end
      i += 1  
    end  
    false
  end

  def not_in_curr_box(val, i_start_from, j_start_from)  
    i = 0
    while(i < 3)
      j = 0
      while(j < 3)
        if arr[i+i_start_from][j+j_start_from] == val
          return true
        end 
        j += 1 
      end
      i += 1  
    end
    false  
  end  

  def have_more_location
    i = 0
    while(i < num)
      j = 0
      while(j < num)
        if(arr[i][j] == 0)
          @row = i
          @col = j
          return true
        end  
        j += 1
      end
      i += 1
    end
    false    
  end  
end 

arr = [[3,0,6,5,0,8,4,0,0],
      [5,2,0,0,0,0,0,0,0],
      [0,8,7,0,0,0,0,3,1],
      [0,0,3,0,1,0,0,8,0],
      [9,0,0,8,6,3,0,0,5],
      [0,5,0,0,9,0,6,0,0],
      [1,3,0,0,0,0,2,5,0],
      [0,0,0,0,0,0,0,7,4],
      [0,0,5,2,0,6,3,0,0]]
sg = SudokuGame.new(arr) 
puts "Before.."
puts sg.arr.to_s
sg.solve_it
puts "After.."
puts sg.arr.to_s