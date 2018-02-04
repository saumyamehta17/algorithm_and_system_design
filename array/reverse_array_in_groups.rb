arr = [1, 2, 3, 4, 5, 6, 7, 8, 9] #[1,2,3,4,5]
n = arr.length
k = 10
puts "Before reverse..."
puts arr.to_s  

def reverse_in_group(arr, n , k)
  if(k >= n)
    puts "Invalid input"
    return false
  end

  if(k == 1)
    puts "list remain unchanged"
  end  

  i = 0
  while(i < n)
    l = i; r = [i + (k-1), n-1].min
    while(l < r)
      temp = arr[r]
      arr[r] = arr[l]
      arr[l] = temp
      l += 1
      r -= 1
    end
    i += k  
  end
  puts "After reverse..."
  puts arr.to_s  
end

reverse_in_group(arr, n , k)  