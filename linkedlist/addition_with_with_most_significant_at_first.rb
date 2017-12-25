# L1 -  89
# l2 - 572
# result = 661
require 'pry'
Node = Struct.new(:data, :next)

class LinkedList
  attr_accessor :head1, :head2,
                :result, :carry,
                :len1, :len2

  def initialize
    @carry = 0
  end

  def push(data, list)
    node = Node.new(data)
    if list == 1
      node.next = head1
      self.head1 = node
    elsif list == 2
      node.next = head2
      self.head2 = node
    elsif list == 3
      puts "data came #{data}"
      node.next = result
      self.result = node
    end  
  end

  def print_it(node)
    current_node = node
    while(!current_node.nil?)
      puts "#{current_node.data}  "
      current_node = current_node.next
    end  
  end

  def add_lists
    # lists start from head1 and head2
    # check size of lists
    if same_size?
      puts "Found same size"
      get_sum
    else
      puts "Found different same size"
      # make head1 list bigger if not by switching pointers
      if(len1 < len2)
        tmp = head1
        self.head1 = head2
        self.head2 = tmp
      end
      diff = (len1 - len2).abs
      curr = head1

      # move head1 pointer diff steps to make same length of lists and 
      # remaing list will be proceesed after that
      1.upto(diff).each do |x|
        puts "#{x} time.."
        curr = curr.next
      end   
      puts "start with #{curr.data}"
      get_sum(curr, head2)
      propagate_carry(head1, curr)
    end
    push(carry, 3) if carry > 0   
  end

  def propagate_carry(node, curr)
    if(node == curr)
      return
    end  
    propagate_carry(node.next, curr)
    sum = node.data + carry
    sum = sum % 10
    self.carry = sum / 10
    push(sum, 3)
  end  

  def same_size?
    self.len1 = getsize(head1)
    self.len2 = getsize(head2)
    len1 == len2
  end

  def get_sum(node1, node2)
    if(node1.nil?)
      return 0
    end
    get_sum(node1.next, node2.next)
    sum = node1.data + node2.data + carry
    temp_sum = sum
    puts "carry is #{carry} and sum is #{sum} and carry should be #{sum / 10}"
    sum = temp_sum % 10
    self.carry = temp_sum / 10
    push(sum, 3)
  end

  def getsize(node)
    curr = node
    count = 0
    while(!curr.nil?)
      curr = curr.next
      count += 1
    end  
    count
  end  
    
end

ll = LinkedList.new  
ll.push(9, 1) 
ll.push(6, 1)
ll.push(5, 1)

ll.push(2, 2)
ll.push(7, 2)
puts "First list\n"
ll.print_it(ll.head1)

puts "First list\n"
ll.print_it(ll.head2)
puts "\n"
ll.add_lists
ll.print_it(ll.result)

