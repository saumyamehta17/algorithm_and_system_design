Position = Struct.new(:row, :col)
class NQSol
  attr_reader :positions, :n
  def initialize(n)
    @n = n
    @positions = Array.new(n){Position.new}
  end

  def start
    row = 0
    sol = nq(row)
    if sol
      puts positions.to_s
    else
      puts "No Sol"
    end  
  end

  def nq(row)
    if(row == n)
      return true
    end  
    col = 0
    while(col < n)
      found_safe = true
      q = 0
      while(q < row)
        if not_safe?(q, row, col)
          found_safe = false
          break;
        end
        q += 1  
      end

      if(found_safe)
        @positions[row].row = row
        @positions[row].col = col
        if nq(row+1)
          return true
        end  
      end

      col += 1  
    end  
  end

  def not_safe?(q,row, col)
    positions[q].row == row ||
    positions[q].col == col ||
    positions[q].row + positions[q].col == row+col ||
    positions[q].row - positions[q].col == row-col
  end  
end  

NQSol.new(4).start