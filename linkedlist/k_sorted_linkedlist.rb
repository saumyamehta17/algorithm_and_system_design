Node = Struct.new(:data, :next)
def ms(arr, k)
  i = 0
  while(i < k-1)
    l1 = arr[i]
    l2 = arr[i+1]

    arr[i+1] = rec_ms(l1, l2)
    i += 1
  end  
  arr[k-1]
end  

def rec_ms(h1, h2)
  if h1.nil?
    return h2
  end
  if h2.nil?
    return h1
  end

  if h1.data < h2.data
    h1.next = rec_ms(h1.next, h2)
    h1
  else
    h2.next = rec_ms(h2.next, h1)
    h2
  end    
end  

def print_it(res)
  while(!res.nil?)
    puts res.data
    res = res.next
  end  
end  

Node.new(:data, :next)

h1 = Node.new(5)
h1.next = Node.new(7)
h1.next.next = Node.new(9)

h2 = Node.new(4)
h2.next = Node.new(6)
h2.next.next = Node.new(8)

h3 = Node.new(1)
h3.next = Node.new(10)

arr = [h1, h2, h3]
k = 3
res = ms(arr, k)
print_it res