# Node = Struct.new(:data, :next, :random)
Node = Struct.new(:data, :next, :random, :copy)
class LinkedList
  attr_reader :head, :cloned_head

  def initialize(data)
    @head = Node.new(data)
  end

  def self.sample
    ll = LinkedList.new(1)
    head = ll.head
    head.next = Node.new(2)
    head.next.next = Node.new(3)
    head.next.next.next = Node.new(4)
    head.next.next.next.next = Node.new(5)

    head.random = head.next.next
    head.next.random = head
    head.next.next.random = head.next.next.next.next
    head.next.next.next.random = head.next.next.next.next
    head.next.next.next.next.random = head.next
    ll
  end

  # using space o(n) and time o(n)
  def clone_v2
    # added a copy pointer in Node
    @cloned_head = Node.new
    curr = head
    copy_curr = cloned_head
    while(!curr.nil?)
      copy_curr.data = curr.data
      copy_curr.next = Node.new
      curr.copy = copy_curr
      curr = curr.next
      copy_curr = copy_curr.next
    end  

    curr = head
    copy_curr = cloned_head
    while(!curr.nil?)
      copy_curr.random = curr.random.copy
      curr  = curr.next
      copy_curr = copy_curr.next
    end  
  end  


  # using time o(n) and space o(1)
  def clone

    curr = head
    while(!curr.nil?)
      node = Node.new(curr.data)
      if cloned_head.nil?
        @cloned_head = node
      end  
      next_node = curr.next
      node.next = curr.next
      curr.next = node
      curr = next_node
    end

    # print_next

    # copy random pointers
    curr = head
    while(!curr.nil?)
      curr.next.random = curr.random.next
      curr = curr.next.nil? ? curr.next : curr.next.next
    end

    # recover original list
    curr = head
    while(!curr.nil?)
      curr.next = curr.next.next
      curr = curr.next
    end  

  end

  def print_next
    curr = head
    while(!curr.nil?)
      print "#{curr.data} --> "
      curr = curr.next
    end  
  end  

  def print_it(node = head)
    curr = node
    while(!curr.nil?)
      puts "#{curr.data} --Next--> #{curr.next.data if curr.next}--Random--> #{curr.random.data}" unless curr.random.nil?
      curr = curr.next
    end  
  end  
end  


ll = LinkedList.sample
puts "Original List"
ll.print_it
puts "Cloned List"
# ll.clone
# ll.print_it(ll.cloned_head)

ll.clone_v2
# puts ll.cloned_head
ll.print_it(ll.cloned_head)