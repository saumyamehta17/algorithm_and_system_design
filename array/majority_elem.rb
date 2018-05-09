def majority_elem_using_hash(arr)
  n = arr.length
  return "Input Invalid" if n == 0
  hsh = {}
  req_ocurrence = n/2
  for i in 0...n
    hsh[arr[i]] ||= 1
    if hsh[arr[i]] > req_ocurrence
      return "Majority Elem is #{arr[i]}"
    else
      hsh[arr[i]] += 1
    end  
  end
  return "No Majority element"  
end


def find_candidate(arr,n)
  mindex = 0
  count = 1
  for i in 1...n
    if arr[i] == arr[mindex]
      count += 1
    else
      count -= 1
    end
    if count == 0
      mindex = i
      count = 1
    end  
  end
  mindex  
end  

def majority_elem_using_moore_voting(arr)
  n = arr.length
  req_ocurrence = n/2
  candidate = find_candidate(arr,n)
  puts candidate
  count = 0
  for i in 0...n
    if arr[i] == arr[candidate]
      count += 1
    end  
  end  

  if count > req_ocurrence
    return "Majority found #{arr[candidate]}"
  else
    "No Majority elem found"
  end  

end  


arr = [1, 3, 3, 1, 2]
arr = [2,2,2,2,5,5,2,3,3]
arr = [3, 3, 4, 2, 4, 4, 2, 4, 4]
# puts majority_elem_using_hash(arr)
puts majority_elem_using_moore_voting(arr)