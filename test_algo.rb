def cs(arr, sum, n, indx)
  if(sum == 0)
    @count += 1
    return
  end

  for i in indx...n
    if(sum - arr[i] < 0)
      return
    end

    cs(arr, sum - arr[i], n, i)
  end
end  

arr = [1,2,3]
n = arr.length
@count = 0
indx = 0
sum = 4
cs(arr, sum, n, indx)
puts @count