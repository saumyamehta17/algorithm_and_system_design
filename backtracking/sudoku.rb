class SudokuGame
  attr_reader :num, :arr, :divider_num

  def initialize(arr, num, divider_num)
    @arr = arr
    @num = num
    @divider_num = divider_num
  end

  def solve_it

    #base case
    i,j = have_more_location
    if i.nil?
      return true
    end 

    for x in 1..num
      # puts "i: #{i} j: #{j}  x: #{x}"
      if is_safe(x, i, j)
        
        @arr[i][j] = x

        if solve_it
          return true
        end

        @arr[i][j] = 0
      end
    end  
    return false  
  end

  def is_safe(x, i, j)
   return !not_in_curr_row(x, i) && 
          !not_in_curr_col(x, j) && 
          !not_in_curr_box(x, i,j)
  end  

  def not_in_curr_row(val, row)
    for x in 0...num
      return true if arr[row][x] == true
    end
    false  
  end

  def not_in_curr_col(val, col)
    for x in 0...num
      return true if arr[x][col] == true
    end    
    false
  end

  def not_in_curr_box(val, i, j)  
    start_x = (i/divider_num) * divider_num
    start_y = (j/divider_num) * divider_num
    for x in start_x...(start_x+divider_num)
      for y in start_y...(start_y+divider_num)
        return true if arr[x][y] == val
      end
    end    
    false  
  end  

  def have_more_location
    for x in 0...num
      for y in 0...num
        return x,y if arr[x][y] == 0
      end
    end
    return nil
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
num = 9
divider_num = 3
# arr = [
#         [1,0,3,0],
#         [0,0,2,1],
#         [0,1,0,2],
#         [2,4,0,3]
#       ]      
# num = 4
# divider_num = 2      
sg = SudokuGame.new(arr, num, divider_num) 
puts "Before.."
puts sg.arr.to_s
sg.solve_it
puts "After.."
puts sg.arr.to_s