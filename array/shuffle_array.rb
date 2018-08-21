def shuffle(arr)
  n = arr.length
  for i in 0...n
    indx = rand(n)
    temp = arr[i]
    arr[i] = arr[indx]
    arr[indx] = temp
  end
  puts arr.to_s  

  (n-1).downto(0).each do |i|
    indx = rand(i)
    temp = arr[i]
    arr[i] = arr[indx]
    arr[indx] = temp
  end
  puts arr.to_s  
end  
arr = [1,2,3,4,5,6]
puts arr.to_s
shuffle(arr)