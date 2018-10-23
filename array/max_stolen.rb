# Maximum sum such that no two elements are adjacent

# Find maximum possible stolen value from houses

def get_max_val(arr, n)
  if(n == 0)
    return arr[0]
  end

  if(n == 1)  
    return [arr[0], arr[1]].max
  end

  prev_prev_val = arr[0]
  prev_val = [arr[0], arr[1]].max
  i = 2
  while(i < n)  
    val = [(arr[i] + prev_prev_val), prev_val].max
    prev_prev_val = prev_val
    prev_val = val
    i += 1
  end
  [prev_val, prev_prev_val].max  
end

arr = [6, 7, 1, 3, 8, 2, 4]

puts get_max_val(arr, arr.length)  
