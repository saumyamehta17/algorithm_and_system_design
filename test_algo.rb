require 'pry'
# def water_flow(a,i,j,row,col)
#   if col > row
#     puts "Incorrect Input" 
#     return false
#   end  

#   if(i == row && j == col)
#     puts a > 1 ? 1 : a
#     return true
#   end

#   for x in 1..(i+1)
#     return false if(i+1>row)
#     puts "#{i+1} -- #{x}"
#     new_a = a > 1 ? ((a-1).to_f/2).to_f : 0
#     if water_flow(new_a, i+1, x, row, col)
#       return true
#     end  
#   end  
# end  


def water_overflow(a, row, col)
  return if col > row
  index = 0
  n = (row*(row+1))/2
  glass = Array.new(n, 0)
  glass[index] = a
  for i in 1..row
    for j in 1..i

      val = glass[index]
      new_val = val > 1 ? (val-1).to_f/2 : 0
      if new_val.zero?
        break
      end
      glass[index] = 1
      glass[index + i] += new_val
      glass[index + i + 1] += new_val  
      index += 1
    end
  end
  puts glass.to_s
  puts glass[row+col-1]
end  
a = 5
row = 3
col = 2
water_overflow(a,row,col)