# Given n non-negative integers representing an elevation map where the width of 
# each bar is 1, compute how much water it is able to trap after raining
# Time Complexity is o(n) and space complexity is o(n).. 
# we can optimize space complexity to o(1)


def trapped_water(arr, n)
  left = []; right = [];

  left[0] = arr[0]
  i = 1
  while(i < n)
    left[i] = [left[i-1], arr[i]].max
    i += 1
  end

  right[n-1] = arr[n-1]
  i = n-2
  while(i >= 0)
    right[i] = [right[i+1], arr[i]].max
    i -= 1
  end

  i = 0; val = 0
  while(i < n)  
    val += [left[i], right[i]].min - arr[i]
    i += 1
  end 

  puts "Trapped Water units #{val}"
end  

arr = [3,0,0,2,0,4]
trapped_water(arr, arr.length)