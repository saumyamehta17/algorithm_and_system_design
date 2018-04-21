class Node
  attr_accessor :left, :right, :next_pointer, :val
  def initialize(val)
    @val = val
  end
end


class BinaryTree
  attr_accessor :root, :left_view_nodes

  def initialize(val)
    @root = Node.new(val)
    @left_view_nodes = []
  end

  def self.sample
    root = BinaryTree.new(10).root
    root.left = Node.new(8)
    root.right = Node.new(2)
    root.left.left = Node.new(3)
    root.right.right = Node.new(12)
    root
  end

  def self.connect_nodes(node)
    q = Array.new
    q.push(node)

    while(!q.empty?)
      node_count = q.size
      while(node_count > 0)
        current_node = q.shift
        peeked_node = q.first

        q.push(current_node.left) unless current_node.left.nil?
        q.push(current_node.right) unless current_node.right.nil?
        node_count -= 1
        if(node_count > 0)
          current_node.next_pointer = peeked_node.val
          puts "#{current_node.val} --> #{peeked_node.val}"
        end  
      end
      current_node.next_pointer = nil
      puts "#{current_node.val} --> nil"
    end
  end

  def self.connect_nodes_with_queue(node)
    q = Queue.new
    q.enq(node)
    while(!q.empty?)
      node_count = q.length
      prev = nil
      while(node_count != 0)
        curr_node = q.deq
        if prev
          prev.next = curr_node
        else
          @left_view_nodes << curr_node
        end  
        prev = curr_node
        q.enq(curr_node.left) if !curr_node.left.nil?
        q.enq(curr_node.right) if !curr_node.right.nil?
        node_count -= 1
      end  
    end  
  end  

  def print_it
    for node in left_view_nodes
      curr = node
      while !curr.nil?
        print curr.data
        curr = curr.next
        print '-->' if !curr.nil?
      end  
      puts "\n"
    end  
  end

end  

root = BinaryTree.sample
# BinaryTree.connect_nodes(root)
BinaryTree.connect_nodes_with_queue(root)