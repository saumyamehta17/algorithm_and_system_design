# input array [4, 5, 2, 25]
# output array will be [5,25.25,-1]

#  Following will not maintain sort order
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


#  Following will maintain sort order
def next_greater_elem(arr)
  n = arr.length
  return if n == 0
  s1 = []
  nge = Array.new(n)

  (n-1).downto(0).each do |i|
    if !s1.empty?
      while(!s1.empty? && s1.last < arr[i])
        s1.pop
      end  
    end

    nge[i] = s1.empty? ? -1 : s1.last
    s1.push(arr[i])
  end

  puts nge.to_s  
end
arr = [11, 13, 21, 3]
next_greater_elem(arr)  
