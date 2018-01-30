# arr = [3,1,4,6,5]
arr = [10, 4, 6, 12, 5]
n = arr.length

def is_pythagoras(arr, n)
  i = 0

  # squaring each elem with o(n)
  while(i < n)
    arr[i] = arr[i] * arr[i]
    i += 1
  end  

  # sorting
  arr = arr.sort #o(log(n))

  #
  i = n-1
  while(i >= 2) 
    l = 0; r = i-1 #sub array
    while(l < r)
      if(arr[l] + arr[r] == arr[i])
        return true
      end
      
      if(arr[l] + arr[r] > arr[i])  
        r -= 1
      else
        l += 1
      end    
    end
    i -= 1  
  end
  return false  
end

puts is_pythagoras(arr, n)