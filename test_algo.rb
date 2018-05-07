Node = Struct.new(:buy, :sell)

def kadane(arr)
  return nil if arr.empty?
  n = arr.length
  i = 0
  s = 0
  start = 0
  _end = 0
  local_sum = 0
  max_sum = arr[0]
  while(i < n)
    local_sum += arr[i]
    if local_sum > max_sum
      max_sum = local_sum
      _end = i
      start = s
    end

    if local_sum < 0
      local_sum = 0
      s = i
    end  
    i += 1
  end
  
  puts max_sum  
end

arr = [-1, -2, -3, -4]
arr = [-2, -3, 4, -1, -2, 1, 5, -3]
kadane(arr)