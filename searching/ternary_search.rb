def ternary_search(arr, low, hi, val)

  while(low <= hi)
    mid1 = (low  + hi)/3
    mid2 = (mid1 + hi)/3
    puts mid2
    if(val == arr[mid1])
      puts "#{val} Found at #{mid1}"
      return
    elsif (val == arr[mid2])
      puts "#{val} Found at #{mid2}"
      return
    elsif (val > arr[mid2])
      low = mid2+1
    elsif (val < arr[mid1])
      hi = mid1-1
    else
      low = mid1+1
      hi = mid2-1
    end
  end  
  puts "Not Found.."
end

arr = [10,20,21,35,40,88,90]
ternary_search(arr, 0, arr.length-1, 88)  