# complexity is o(n^2)
def lis(arr)
  len = arr.length
  lis = Array.new(len, 1)

  for i in 1...len
    for j in 0..i
      if arr[i] > arr[j]
        lis[i] = [lis[i], (lis[j] + 1)].max
      end  
    end
  end    

  puts lis.to_s
end  

arr = [3, 10, 2, 1, 20]
arr = [3,4, -1,0,6,2,3]
lis(arr)