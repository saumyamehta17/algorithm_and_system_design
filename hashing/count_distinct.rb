# Time complexity is nk2
def count_distinct_naive(arr, n , k)

  for i in (0...n-k+1)
    distint_count = 0
    for j in i...(k+i)

      for l in i..j
        if arr[j] == arr[l]
          break
        end
      end
      if j == l
        distint_count += 1
      end

    end
    puts distint_count
  end        
end  



# Time complexity is o(n)
def count_distinct_using_hashing(arr, n , k)
  hsh = {}
  distint_count = 0
  for i in 0...k
    if(hsh[arr[i]])
      hsh[arr[i]] += 1
    else
      hsh[arr[i]] = 1
      distint_count += 1
    end  
  end

  puts distint_count  

  for i in k...n

    if hsh[arr[i-k]] == 1
      hsh[arr[i-k]] = nil
      distint_count -= 1
    else
      hsh[arr[i-k]] -= 1
    end

    if(hsh[arr[i]])
      hsh[arr[i]] += 1
    else
      hsh[arr[i]] = 1
      distint_count += 1
    end

    puts distint_count
  end  
end  


arr = [1, 2, 1, 3, 4, 2, 3]
k = 4
n = arr.length

# count_distinct_naive(arr, n,k)
count_distinct_using_hashing(arr, n, k)