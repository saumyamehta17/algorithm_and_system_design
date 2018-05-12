
def flatten(head)
  return head if head.nil?

  head.next = sort(head.next, head.down)
  head.down = nil
  flatten(head.next)

end  

def sort(l1, l2)
  if l1.nil?
    return l2
  end
  
  if l2.nil?
    return l1
  end

  if l1.data <= l2.data
    res = l1
    res.next = sort(l1.next, l2)
  else
    res = l2
    res.next = sort(l1, l2.next)  
  end 
  res 
end

def print_it(h)
  curr = h
  while(!curr.nil?)
    print curr.data
    down = curr.down
    while(!down.nil?)
      print "-->d #{down.data}"
      down = down.next
    end  
    puts ""
    curr = curr.next
  end  
end  


Node = Struct.new(:data, :next, :down)
h1 = Node.new(10)
h1.next = Node.new(20)
h1.next.next = Node.new(30)
h1.down = Node.new(11)
h1.down.next = Node.new(25)
h1.next.down = Node.new(22)
h1.next.down.next = Node.new(23)
print_it(h1)

flatten(h1)

print_it(h1)
# Let us create the following linked list
#       5 -> 10 -> 19 -> 28
#       |     |     |    |
#       V     V     V    V
#       7     20   22   35
#       |     |     |
#       V     V     V
#       8     50   40
#       |           |
#       V           V
#       30         45
# We need two pointers - down, right
# its like 2D LinkedList make it as 1D sorted linked list
# output  - 5 7 8 10 19 20 20 22 30 35 40 45 50

require 'pry'
Node = Struct.new(:data, :down, :right)


class LinkedList
  attr_accessor :head

  def push(head_ref, data)
    node = Node.new(data)
    node.down = head_ref
    node
  end

  def flatten(root)
    if(root.nil? || root.right.nil?)
      return root
    end

    root.right = flatten(root.right)

    root = merge(root, root.right)

    return root
  end

  def merge(a,b)
    if(a.nil?)
      return b
    end

    if(b.nil?)
      return a
    end
    
    if(a.data < b.data)
      res = a
      res.down = merge(a.down, b)
    else
      res = b
      res.down = merge(a, b.down)  
    end
    return res  
  end

  def print_it
    current_node = head
    while(!current_node.nil?)
      puts current_node.data
      current_node = current_node.down
    end  
  end  

end  

ll = LinkedList.new
ll.head = ll.push(ll.head, 30)
ll.head = ll.push(ll.head, 8)
ll.head = ll.push(ll.head, 7)
ll.head = ll.push(ll.head, 5)

ll.head.right = ll.push(ll.head.right, 50)
ll.head.right = ll.push(ll.head.right, 20)
ll.head.right = ll.push(ll.head.right, 10)

ll.head.right.right = ll.push(ll.head.right.right, 45)
ll.head.right.right = ll.push(ll.head.right.right, 40)
ll.head.right.right = ll.push(ll.head.right.right, 22)
ll.head.right.right = ll.push(ll.head.right.right, 19)

ll.head.right.right.right = ll.push(ll.head.right.right.right, 35)
ll.head.right.right.right = ll.push(ll.head.right.right.right, 28)

ll.flatten(ll.head)
puts "Print flatten...."
ll.print_it
puts "Print flatten....Done"