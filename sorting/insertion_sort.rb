arr = [12, 11, 13, 5, 6]

len = arr.length

for i in 1...len
  key = arr[i]
  j = i-1
  while(j >= 0 && arr[j] > key)
    arr[j+1] = arr[j]
    j -= 1
  end
  arr[j+1] = key  
end  

puts arr.to_s
# o(n2)