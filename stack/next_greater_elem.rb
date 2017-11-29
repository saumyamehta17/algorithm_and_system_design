# input array [4, 5, 2, 25]
# output array will be [5,25.25,-1]

def print_next_greater_elem(arr)
  nge = []
  nge.push(arr[0])
  i = 1; n = arr.length

  while(i < n)
    current_elem = arr[i]
    popped_elem = nge.pop

    if(current_elem > popped_elem)
      puts "#{popped_elem} --> #{current_elem}"
      # pop while stack is not empty and current elem is greater than popped one
      while(!nge.empty?)
        pop_again = nge.pop
        if(current_elem > pop_again)
          puts "#{pop_again} --> #{current_elem}"
        else
          nge.push(pop_again)  
        end  
      end  
    # else push back to nge stack  
    else
      nge.push(popped_elem)
    end  
    nge.push(current_elem)
    i += 1
  end

  # pop each remaing element from stack nge
  nge.each do |n|
    puts "#{n} --> -1"
  end  
end  

print_next_greater_elem([4, 5, 2, 25])