# two arrays as input arrival and departure
def min_platform_needed(arr, dep)
  # sort both arrays and will have o(logn) time complexity
  # sort(arr)
  # sort(dep)

  len = arr.length
  i = 0; j = 0
  platform_req = 0; result = 0

  while(i < len && j < len)
    if(arr[i] < dep[j])
      platform_req += 1
      i += 1
      result = [result, platform_req].max
    else
      platform_req -= 1
      j += 1
    end  
  end

  puts "Platform needed for railway station are #{result}"  
end  

arr = [900,  940, 950,  1100, 1500, 1800]
dep = [910, 1200, 1120, 1130, 1900, 2000]

min_platform_needed(arr, dep)