  # print duplicate only once
def print_repeating_uniqly(arr, n)
  i = 0
  while(i < n)
    indx = arr[i]%n
    arr[indx] += n
    i += 1
  end

  i = 0
  while(i < n)
    if arr[i]/n > 1
      puts i
    end
    i += 1  
  end  
end


# this prints duplicate values as many times as its occurence
def print_repeating(arr, n)
  i = 0
  while( i < n)
    val = arr[arr[i].abs]
    if(val >= 0)
      arr[arr[i].abs] = -val
    else
      print "#{arr[i].abs} "
    end  
    i += 1
  end
  puts arr.to_s  
end  

arr = [1, 6, 2, 1, 3, 6, 6]
# print_repeating(arr, arr.length)
print_repeating_uniqly(arr, arr.length)