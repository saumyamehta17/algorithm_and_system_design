def ksorted(lists)
  n = lists.length
  if(n == 1)
    
    print_it(lists[0])
    return true
  end

  low = 0
  hi = n - 1
  res = []
  while(low < hi)
    res << sort(lists[low], lists[hi])
    low += 1
    hi -= 1
  end
  if(low == hi)
    res << lists[low]
  end  

  if ksorted(res)  
    return true
  end  

end 

def sort(list1, list2)
  if list1.nil?
    return list2
  end
  
  if list2.nil?
    return list1
  end  

  if list1.data <= list2.data
    res = list1
    res.next = sort(list1.next, list2)
  else
    res = list2
    res.next = sort(list1, list2.next)
  end
  res  
end  

def print_it(head) 
  curr = head
  while(!curr.nil?)
    print "#{curr.data} ->"
    curr = curr.next
  end  
  puts "\n"
end

Node = Struct.new(:data, :next)
h1 = Node.new(2)
h1.next = Node.new(7)
h1.next.next = Node.new(10)

h2 = Node.new(1)
h2.next = Node.new(11)
h2.next.next = Node.new(12)

h3 = Node.new(3)
h3.next = Node.new(27)
h3.next.next = Node.new(30)

puts "-------------Sorted Lists Are----------"
print_it(h1)
print_it(h2)
print_it(h3)
puts "-------------Merged Lists-------------"

ksorted([h1,h2,h3])
