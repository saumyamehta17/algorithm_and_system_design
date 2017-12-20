require 'pry'
class Node
  attr_accessor :left, :right, :value

  def initialize(val)
    @value = val
  end  
end

class QD
  attr_accessor :hd, :node
  def initialize(hd, node)
    @hd = hd
    @node = node
  end  
end  

class BinaryTree
  attr_accessor :root
  @hsh = {}

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    root = BinaryTree.new(20).root
    root.left = Node.new(8)
    root.left.left = Node.new(5)
    root.left.right = Node.new(3)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    root.right = Node.new(22)
    root.right.right = Node.new(25)
    root
  end

  def self.bottom_view(node, hd=0)
    q = Queue.new
    q.enq(QD.new(hd, node))
    while(!q.empty?)
      qd_node = q.deq
      @hsh[qd_node.hd] = qd_node.node.value
      hd = qd_node.hd
      node = qd_node.node
      q.enq(QD.new(hd-1, node.left)) unless node.left.nil?
      q.enq(QD.new(hd+1, node.right)) unless node.right.nil?
    end  
  end

  def self.print_in_vertical_order(node, hd = 0)
    q = Queue.new
    q.enq(QD.new(hd, node))
    while(!q.empty?)
      qd_node = q.deq
      @hsh[qd_node.hd] = @hsh[qd_node.hd].nil? ? [qd_node.node.value] : @hsh[qd_node.hd] + [qd_node.node.value]
      hd = qd_node.hd
      node = qd_node.node
      q.enq(QD.new(hd-1, node.left)) unless node.left.nil?
      q.enq(QD.new(hd+1, node.right)) unless node.right.nil?
    end  
  end  

  def self.print_it
    @hsh.each do |k,v|
      print v
      puts "\n"
    end  
  end  
end  

root = BinaryTree.sample
# BinaryTree.bottom_view(root)
# BinaryTree.print_it
BinaryTree.print_in_vertical_order(root)
BinaryTree.print_it     

