# Complexity is o(n)
def print_in_zig_zag(arr, n)
  # array length is 1
  return if(n == 1)

  i = 1; flag = 0

  while(i < n)
    if(flag == 0 && arr[i] < arr[i-1])
      swap(arr, i,i-1)
    elsif (flag == 1 && arr[i] > arr[i-1])
      swap(arr, i,i-1)
    end  

    i += 1; flag = flag == 0 ? 1 : 0
  end
  puts "After zig zag"
  puts arr.to_s  
end  

def swap(arr, index1, index2)
  temp = arr[index1]
  arr[index1] = arr[index2]
  arr[index2] = temp
end  

arr = [4, 3, 7, 8, 6, 2, 1]
n = arr.length
puts "Before zig zag"
puts arr.to_s
print_in_zig_zag(arr, n)