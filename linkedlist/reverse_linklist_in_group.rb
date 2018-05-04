Node = Struct.new(:data, :next)
class LinkList
  attr_reader :head

  def initialize(val)
    @head = Node.new(val)
  end

  def self.sample
    ll = LinkList.new(1)
    head = ll.head
    head.next = Node.new(2)
    head.next.next = Node.new(3)
    head.next.next.next = Node.new(4)
    head.next.next.next.next = Node.new(5)
    head.next.next.next.next.next = Node.new(6)
    head.next.next.next.next.next.next = Node.new(7)
    head.next.next.next.next.next.next.next = Node.new(8)
    ll
  end

  def reverse_in_grp(head, k)
    c = 0
    curr = head
    prev = nil
    while(c < k && !curr.nil?)
      next_node = curr.next
      curr.next = prev
      prev = curr
      curr = next_node
      c += 1
    end

    if !curr.nil?
      head.next = reverse_in_grp(curr, k)
    end  
    prev
  end

  def print_it(node = head)
    curr = node
    while(!curr.nil?)
      print "#{curr.data} --> "
      curr = curr.next
    end  
  end  
end 

ll = LinkList.sample 
k = 3
ll.print_it(ll.head)
puts "\nAfter reverse in #{k}"
node = ll.reverse_in_grp(ll.head, k)
ll.print_it(node)
puts "\n"