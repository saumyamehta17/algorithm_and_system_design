Position = Struct.new(:row, :col)

class NQSolution

  attr_accessor :positions, :n

  def initialize(n)
    @n = n
    @positions = Array.new(n){ Position.new }
  end

  def start
    puts positions.to_s
    row = 0
    has_sol = nqsol_util(row)
    if has_sol
      puts positions.to_s
    else
      puts "No"
    end  
  end

  def nqsol_util(row)
    if (row == n)
      return true
    end

    col = 0
    while(col < n)
      found_safe = true
      queen = 0
      while(queen < row)
        if positions[queen].row == row ||
           positions[queen].col == col ||
           positions[queen].row + positions[queen].col == row + col ||
           positions[queen].row - positions[queen].col == row - col
           found_safe = false
           break;
        end 
        queen += 1  
      end

      if found_safe
        @positions[row].row = row
        @positions[row].col = col
        if nqsol_util(row+1)
          return true
        end  
      end
      # return false
      col += 1
    end  
  end
end    

NQSolution.new(4).start