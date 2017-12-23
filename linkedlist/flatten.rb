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