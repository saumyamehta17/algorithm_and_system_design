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