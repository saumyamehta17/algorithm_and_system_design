Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end  

  def self.sample
    root = BinaryTree.new(10).root
    root.left = Node.new(20)
    root.right = Node.new(20)
    root
  end

  def self.sample1
    root = BinaryTree.new(10).root
    root.left = Node.new(20)
    root.right = Node.new(20)
    root
  end  

  def self.is_same?(n1, n2)
    if(n1.nil? && n2.nil?)
      return true
    elsif ((n1.nil? && !n2.nil?) || (!n1.nil? && n2.nil?))
      return false
    else
      return n1.data == n2.data &&
             is_same?(n1.left, n2.left) &&
             is_same?(n1.right, n2.right)
    end  
  end  
end

root1 = BinaryTree.sample  
root2 = BinaryTree.sample1  

puts BinaryTree.is_same?(root1, root2)


def is_identical_iterative(head1, head2)
  if head1.nil? && head2.nil?
    return true
  elsif (head1.nil? && !head2.nil?) || (head1.nil? && !head2.nil?)
    return false
  end

  q1 = Queue.new
  q2 = Queue.new
  q1.enq(head1)
  q2.enq(head2)

  while(!q1.empty? && !q2.empty?)
    node1 = q1.deq
    node2 = q2.deq

    return false if node1.data != node2.data

    if node1.left && !node2.left
      return false
    elsif node1.left && node2.left
      
      q1.enq(node1.left)
      q2.enq(node2.left)
    end

    if node1.right && !node2.right
      return false
    elsif node1.right && node2.right
      q1.enq(node1.right)
      q2.enq(node2.right)
    end  
  end
  true  
end  