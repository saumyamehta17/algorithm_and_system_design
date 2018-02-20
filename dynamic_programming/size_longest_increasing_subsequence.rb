# complexity is o(n^2)
def get_lis(arr, n)
  lis = Array.new(n,1)

  i=0; max = 1
  while(i < n)
    j = 0
    while(j < i)
      if(arr[i] > arr[j])
        lis[i] = [lis[j]+1, lis[i]].max
        max = [max, lis[i]].max
      end
      j += 1  
    end
    i += 1  
  end

  puts max
end  

arr = [10, 22, 9, 33, 21, 50, 41, 60, 80]
len = arr.length
get_lis(arr, len)