# Kadane's Algo

def kadane_v2(arr)
  n = arr.length
  i = 0
  max_sum = arr[0]
  local_sum = 0
  while(i < n)
    local_sum = [arr[i], local_sum+arr[i]].max
    max_sum = [max_sum, local_sum].max
    i += 1
  end

  puts max_sum
end

def kadane(arr)
  n = arr.length
  curr = 0
  max_so_far = arr[0]
  i = 0; start = 0; _end = 0; s = 0

  while(i < n)
    curr += arr[i]
    puts curr
    if(curr > max_so_far)
      max_so_far = curr
      start = s
      _end  = i
    end

    if(curr < 0)
      curr = 0
      s = i+1
    end
    i += 1
  end

  puts "max sum is #{max_so_far}"
  puts "start from #{start}"
  puts "ends at #{_end}"
end

arr = [-2, -3,  -1,4,6,-1]
arr = [-4,-3]
kadane(arr)
# kadane_v2(arr)