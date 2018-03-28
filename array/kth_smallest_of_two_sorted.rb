require 'pry'
def kth(arr1, arr2, n1, n2, s1, s2, k)
  puts "k - #{k} s1- #{s1} s2- #{s2}"
  if(s1 == n1)
    arr2[k]
  end

  if(s2 == n2)
    arr1[k]
  end

  if(k == 1)
    # binding.pry
    return arr1[s1] > arr2[s2] ? arr2[s2] : arr1[s1]
  end

  mid = k/2

  if(mid >= (n1-s1))
    
  end
  
  if(mid > (n2-s2))  

  else
    if(arr1[s1+mid-1] < arr2[s2+mid-1])
      kth(arr1, arr2, n1, n2, s1+mid, s2, k-mid)
    else  
      kth(arr1, arr2, n1, n2, s1, s2+mid, k-mid)
    end
  end   
end 

arr1 = [7,9]
arr2 = [1,4,9,10]
k = 5
puts kth(arr1, arr2, arr1.length, arr2.length, 0, 0, k)