# input array [4, 5, 2, 25]
# output array will be [5,25.25,-1]

def nge(arr)
  s = []
  s.push(arr[0])

  for i in 1...arr.length
    curr_elem = arr[i]
    popped_elem = s.pop
    if curr_elem > popped_elem
      puts "#{popped_elem} -> #{curr_elem}"

      while(!s.empty?)
        popped_elem = s.pop
        if(curr_elem > popped_elem)
          puts "#{popped_elem} -> #{curr_elem}"          
        else
          s.push(popped_elem)
          break
        end  
      end  
    else
      s.push(popped_elem)
    end  
    s.push(curr_elem)
  end

  while(!s.empty?)
    puts "#{s.pop} -> -1"
  end  

end  

arr = [1,3,2,4]
arr = [11, 13, 21, 3]
arr = [5,4,3,2,1]
nge(arr)
