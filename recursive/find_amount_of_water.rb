# time complexity is no of glass i.e (row* (row+1))/2
# space complexity is no of glass, as we take an array of size (row* (row+1))/2
require 'pry'
def water_overflow(a, row, col)
  return if col > row
  index = 0
  n = (row*(row+1))/2
  glass = Array.new(n, 0)
  glass[index] = a
  puts glass.to_s
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