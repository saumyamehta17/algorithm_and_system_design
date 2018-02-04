# Element with left side smaller and right side greater
# Left and right side elements can be equal to required element. 
# And extreme elements cannot be required element.

def find_element(arr, n)
  result = -1; max = 0; i = 1

  while(i < n-1)
    if(arr[i] >= arr[max])
      if(result < 0)
        result = i 
        max = i
      end  
    else  
      result = -1 if(result > 0)
    end
    i += 1  
  end  

  result
end

# arr = [5, 1, 4, 3, 6, 8, 10, 7, 9]  
arr = [5, 1, 4, 4]
arr = [1,2,2,2,2,2]
n = arr.length
puts find_element(arr, n)