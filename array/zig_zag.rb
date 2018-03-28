# Complexity is o(n)
def print_in_zig_zag(arr, n)
  # array length is 1
  return if(n == 1)

  i = 0
  while(i < n-1)
      min = [arr[i], arr[i+1]].min
      max = [arr[i], arr[i+1]].max

      if(i%2 == 0)
          arr[i] = min
          arr[i+1] = max
      else
          arr[i] = max
          arr[i+1] = min
      end    
      i+=1
  end
  puts "After..."
  puts arr.to_s  
end  

arr = [4, 3, 7, 8, 6, 2, 1]
n = arr.length
puts "Before zig zag"
puts arr.to_s
print_in_zig_zag(arr, n)