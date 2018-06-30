# complexity is o(n*m)
def naive(arr1, arr2)
  sum1 = 0; sum2 = 0

  for i in 0...arr1.length
    sum1 += arr1[i]
  end

  for i in 0...arr2.length
    sum2 += arr2[i]
  end

  if sum1 == sum2
    return true
  end  


  for i in 0...arr1.length
    for j in 0...arr2.length

      new_sum1 = sum1 - arr1[i] + arr2[j]
      new_sum2 = sum2 - arr2[j] + arr1[i]
      if new_sum2 == new_sum1
        return true
      end  
    end
  end
  return false    
end

arr1 = [4, 1, 2, 1, 1, 2]
arr2 = [3, 6, 3, 3]
# arr2 = [0, 1]
puts naive(arr1, arr2)  


# optimized
# o(m+n)
def using_hash(arr1, arr2)
  m = arr1.length
  n = arr2.length

  if m > n
    temp = arr1
    arr1 = arr2
    arr2 = temp
  end  

  sum1 = 0; sum2 = 0

  for i in 0...arr1.length
    sum1 += arr1[i]
  end

  for i in 0...arr2.length
    sum2 += arr2[i]
  end

  if sum1 == sum2
    return true
  end

  diff = (sum2 - sum1).abs/2

  hsh = {}

  arr1.each do |a|
    hsh[a] = true
  end

  arr2.each do |a|
    if hsh[a + diff] == true
      return true
    end  
  end

  return false    
end  

puts using_hash(arr1, arr2)