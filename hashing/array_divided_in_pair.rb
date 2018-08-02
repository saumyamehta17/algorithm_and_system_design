# Check if an array can be divided into pairs whose sum is divisible by k

# naive - time complexity is o(n2) and space complexity is o(n)
def is_divisible(arr, k)
  n = arr.length
  visited = Array.new(n, 0)

  for i in 0...n

    for j in 0...n

      if visited[i] == 0 && visited[j] == 0 &&
         (arr[i] + arr[j]) % k == 0
         visited[i] = 1
         visited[j] = 1
         break
      end

    end  
  end
  for i in 0...n
    if visited[i] == 0
      return false
    end  
  end

  true  
end  

puts "************* Naive *******************"

arr = [9,7,5,3]
k = 6

arr = [91, 74, 66, 48]
k = 10
puts is_divisible(arr, k)

puts "************* Using Hashing *******************"
# time complexity is o(n)
def is_divisible_using_hashing(arr, k)
  n = arr.length
  hsh = {}
  # collect reminders and their occurences
  for i in 0...n
    if hsh[arr[i] % k]
      hsh[arr[i] % k] += 1
    else
     hsh[arr[i] % k] = 1  
    end  
  end

  # traverse array again to check reminders with following possiblities
  # 1. if reminder is 0, then its occurence must be > 1
  # 2. if reminder divides k in two halves, then its occurence must be > 1
  # 3. if reminder occurence is same as k - reminder occurence

  for i in 0...n
    rem = arr[i] % k
    if rem * 2 == k || rem == 0
      if hsh[rem] == 1
        return false
      end  
    else
      if hsh[rem] != hsh[k-rem]
        return false
      end  
    end      
  end 
  true
end  

puts is_divisible_using_hashing(arr, k)
