require 'pry'
Node = Struct.new(:data, :next)
class LL
  attr_reader :head

  def initialize(val)
    @head = Node.new(val)
  end

  def self.sample
    ll = LL.new(4)
    head = ll.head
    head.next = Node.new(3)
    head.next.next = Node.new(9)
    head.next.next.next = Node.new(10)
    head.next.next.next.next = Node.new(1)
    ll
  end

  def sort(node)
    return node if node.nil? || node.next.nil?

    mid = get_middle(node)
    mid_next = mid.next
    mid.next = nil
    left_list = sort(node)
    right_list = sort(mid_next)
    head = merge_sort(left_list, right_list)
    return head
  end

  def get_middle(node)
    slow = node
    fast = node
    while(!fast.next.nil? && !fast.next.next.nil?)
      slow = slow.next
      fast = fast.next.next
    end
    slow  
  end

  def merge_sort(list1, list2)
    if(list1.nil?)
      return list2
    end
    if(list2.nil?)
      return list1
    end

    result = nil
    if(list1.data < list2.data)
      result = list1
      result.next = merge_sort(list1.next, list2)
    else
      result = list2
      result.next = merge_sort(list1, list2.next)
    end
    return result  
  end

  def print_it(h = @head)
    curr = h
    while(!curr.nil?)
      puts curr.data
      curr = curr.next
    end  
  end  
end  


ll = LL.sample
puts "Before Sort"
ll.print_it
puts "After Sort"
head = ll.sort(ll.head)
ll.print_it(head)