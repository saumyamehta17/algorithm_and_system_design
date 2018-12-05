require 'pry'
Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :max_top
  # cattr_accessor :max_top do 
  #   -4611686014827387903
  # end  
  # max_top track if any sum is less then return max top at the end for whole tree.
  @@max_top = -4611686014827387903

  def self.get_max_top
    @@max_top
  end  

  def initialize(val)
    @root = Node.new(val)
    @max_top = -461168607387903
  end

  def self.sample
    binary_tree = BinaryTree.new(10)
    root = binary_tree.root
    root.left = Node.new(2)
    root.left.left = Node.new(20)
    root.left.right = Node.new(1)
    root.right = Node.new(10)
    root.right.right = Node.new(-25)
    root.right.right.left = Node.new(3)
    root.right.right.right = Node.new(4)
    binary_tree
  end

  # thru class method - wrong way
  
  # def self.max_sum(node)
  #   return 0 if node.nil?

  #   left  = max_sum(node.left)
  #   right = max_sum(node.right)
  #   sum   = left + right + node.data

  #   # max sum track for left or right sumtree sum
  #   max_sum = [[left, right].max + node.data, 
  #               node.data
  #             ].max
  #   @@max_top = [[sum, max_sum].max, @@max_top].max          
  #   # puts @max_top
  #   max_sum
  # end

  def max_sum(node)
    return 0 if node.nil?

    left = max_sum(node.left)
    right = max_sum(node.right)
    sum = left + right + node.data

    max_sum = [[left, right].max + node.data,
                node.data
                ].max
    self.max_top = [[sum, max_sum].max, max_top].max
    max_sum            
  end  


end  

b = BinaryTree.sample
# puts BinaryTree.max_sum(root)
# puts BinaryTree.get_max_top
b.max_sum(b.root)
puts b.max_top