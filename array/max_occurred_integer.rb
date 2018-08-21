# Maximum occurred integer in n ranges

def find_maximum_occurred_int(left_arr, right_arr, n)
  arr = Array.new(100, 0)

  for i in 0...n
    arr[left_arr[i]] += 1
    arr[right_arr[i] + 1] -= 1
  end
  m = 0
  indx = -1
  for i in 1...100
    arr[i] += arr[i-1]
    if m < arr[i]
      m = arr[i]
      indx = i
    end  
  end

  puts "Maximum occurred integer is #{indx} and #{m} times"  
end  

left_arr = [1,4,3,1]
right_arr = [15, 8, 5, 4]

left_arr = [ 1, 4, 9, 13, 21]
right_arr = [15, 8, 12, 20, 30]
n = left_arr.length
find_maximum_occurred_int(left_arr, right_arr, n)