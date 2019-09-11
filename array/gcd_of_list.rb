def gcd_helper(a, b)
  # gcd of 0 and anynumber = anynumber
  return a if b == 0

  gcd_helper(b, a % b)
end

def gcd_of_numbers(arr)
  res = arr[0]
  for i in 1...arr.length
    res = gcd_helper(res, arr[i])
  end 
  res 
end

arr = [2,4,6,8,10]
puts gcd_of_numbers(arr)
