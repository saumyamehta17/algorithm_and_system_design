def triplet(arr)
  n  = arr.length

  # squaring each elem with o(n)
  for i in 0...n
    arr[i] = arr[i] * arr[i]
  end  

  arr = arr.sort #o(log(n))

  (n-1).downto(0).each do |i|
    left = 0
    right = i - 1
    while(left < right)
      if arr[left] + arr[right] == arr[i]
        return true
      end
      
      if arr[left] + arr[right] < arr[i]
        left += 1
      else
        right -= 1
      end    
    end 
  end
  return false  
end



arr = [3,2,1,9,7,4,5]
puts triplet(arr)