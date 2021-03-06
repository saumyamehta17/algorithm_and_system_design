require 'pry'
class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
  end    
end  

class BinaryTree

  attr_accessor :root

  def initialize(val)
    if val.nil?
      @root = nil
    else  
      @root = Node.new val
    end  
  end

  class << self
    def inorder_widout_recursion(tree)
      tmp_arr = []
      node = tree.root
      arr = []
      arr.push(node)

      while(!arr.empty?)
        node = node.left  
        while(node != nil)
          arr.push node
          node = node.left
        end  

        node = arr.pop
        puts node.value
        tmp_arr << node.value

        if(!node.right.nil?)
          node = node.right
          arr.push node
        end
      end
      tmp_arr
    end

    def preorder_widout_recursion(tree)
      node = tree.root
      arr = []
      arr.push(node)
      while(1)
        while(!node.nil?)
          puts node.value
          arr << node.left
          node = node.left
        end  
        return if arr.empty?
        node = arr.pop
        node = node.right unless node.nil?
      end  
    end  

    # def postorder_widout_recursion(tree)
    #   node = tree.root
    #   arr = []
    #   arr.push(node)
    #   while(1)
    #     while(!node.nil?)
    #       arr.push(node)
    #       node = node.left
    #     end  
    #     return nil if arr.empty?
    #     node = arr.pop
    #     if(!node.nil?)
    #       node = node.right
    #     else
    #       puts node.value  
    #     end  

    #   end  
    # end  

    def inorder_wid_recursion(node)
      inorder_wid_recursion(node.left) if(node.left != nil)
      puts node.value
      inorder_wid_recursion(node.right) if(node.right != nil)
    end  

    def preorder_wid_recursion(node)
      puts node.value
      preorder_wid_recursion(node.left) if (node.left != nil)
      preorder_wid_recursion(node.right) if (node.right != nil)
    end  

    def postorder_wid_recursion(node)
      postorder_wid_recursion(node.left) if (node.left != nil)
      postorder_wid_recursion(node.right) if (node.right != nil)
      puts node.value
    end  

    def get_height_of_tree(tree)  
      nodes = inorder_widout_recursion(tree)
      h = Math.log2 (nodes.size + 1)
      puts h.ceil
    end  

    # Get the height of tree with recursion passing root of the tree
    def get_height_wid_recursion(node = root)
      if node.nil?
        return 0
      end
      ldepth = get_height_wid_recursion(node.left)
      rdepth = get_height_wid_recursion(node.right)
      depth = [ldepth, rdepth].max + 1
      return depth
    end 

    # diameter of a tree
    def diameter(node)
      if node.nil?
        return 0
      end  
      lheight = get_height_wid_recursion(node.left)
      rheight = get_height_wid_recursion(node.right)

      ldiameter = diameter(node.left)
      rdiameter = diameter(node.right)

      return [(lheight + rheight + 1), [ldiameter, rdiameter].max].max
    end  

    def count_leaf_nodes(root_node)
      return 0 if root_node.nil?   
      return 1 if root_node.left.nil? & root_node.right.nil?

      return count_leaf_nodes(root_node.left) + count_leaf_nodes(root_node.right)
    end  

    # level order or breadth first search traversal of tree
    def level_order_traversal(root_node)
      queue = Queue.new
      queue.enq root_node
      while(!queue.empty?)
        magic_node = queue.deq

        puts magic_node.value

        queue.enq(magic_node.left) unless magic_node.left.nil?

        queue.enq(magic_node.right) unless magic_node.right.nil?
      end  
    end

    # level order or breadth first search traversal of tree line by line
    def level_order_traversal_line_by_line_sol1(root_node)
      queue = Queue.new
      queue.enq root_node
      while(!queue.empty?)
        node_count = queue.size
        while(node_count > 0)
          node = queue.deq
          print node.value
          print "\s"

          queue.enq node.left unless node.left.nil?
          queue.enq node.right unless node.right.nil?
          node_count -= 1
        end
        puts "\n"
      end      
    end  

    # return 1 if both tree is same else 0
    def is_identical?(node1,node2)
      if (node1.nil? && node2.nil?)
        return true
      elsif !node1.nil? && !node2.nil?

        return node1.value == node2.value &&
               is_identical?(node1.left, node2.left) &&
               is_identical?(node1.right, node2.right)

      elsif (node1.nil? && !node2.nil?) || (node2.nil? && !node1.nil?)
        return false
      end

    end  

    def delete_tree(node, tmp_tree)
      return 0 if node.nil?
      delete_tree(node.left, tmp_tree)
      delete_tree(node.right, tmp_tree)  
      puts "delete #{node.value}"
      node.value = nil  
    end 

    def get_mirror_of_tree(node)
      if node.nil?
        return 
      else
        get_mirror_of_tree(node.left)
        get_mirror_of_tree(node.right)
        tmp = node.left
        node.left = node.right
        node.right = tmp
      end  
      node
    end 


    def root_to_leaf_paths(node, path_arr)
      return if node.nil?
      path_arr << node
      if is_leaf?(node)
        p path_arr.map(&:value).join('->')
        while((node.left.nil? && node.right.nil?))
          binding.pry
          node = path_arr.pop
        end  
      end
      root_to_leaf_paths(node.left, path_arr)        
      root_to_leaf_paths(node.right, path_arr)        
    end

    def is_leaf?(node)
      node.left.nil? && node.right.nil?
    end  

    def sample
      sample_tree = BinaryTree.new 1
      root = sample_tree.root 
      root.left = Node.new 2
      root.right = Node.new 3
      root.left.left = Node.new 4
      root.left.right = Node.new 5

      # uncomment follow to gave big tree
      root.left.right.left = Node.new 6

      root.right.left = Node.new 7
      root.right.left.left = Node.new 8
      root.right.left.right = Node.new 9

      root.left.left.right = Node.new 10
      root.left.left.right.left = Node.new 11

      sample_tree
    end

    def sample1
      sample_tree = BinaryTree.new 1
      root = sample_tree.root 
      root.left = Node.new 2
      root.right = Node.new 3
      root.left.left = Node.new 4
      root.left.right = Node.new 8
      sample_tree
    end  
  end
end  

b = BinaryTree.sample
b1 = BinaryTree.sample1
# puts "---------Inorder Traversal without recursion using stack--"
# BinaryTree.inorder_widout_recursion(b)

# puts "---------Inorder Traversal with recursion-----------------"
# BinaryTree.inorder_wid_recursion(b.root)
# puts "---------Preorder Traversal with recursion-----------------"
# BinaryTree.preorder_wid_recursion(b1.root)
# BinaryTree.preorder_widout_recursion(b1)
# puts "---------Postorder Traversal with recursion-----------------"
# BinaryTree.postorder_wid_recursion(b1.root)
# puts 'kjhjhj'
# BinaryTree.postorder_widout_recursion(b1)
# puts "---------Height Of Tree-----------------"
# BinaryTree.get_height_of_tree(b)
# puts "---------Height of tree with recursion--"
# puts BinaryTree.get_height_wid_recursion(b.root)
# puts "---------Diameter of Tree---------------"
# puts BinaryTree.diameter(b.root)
# puts "---------Count the leaf nodes of Tree----"
# puts BinaryTree.count_leaf_nodes(b.root)
# puts "---------BFS/level order traversal of Tree----"
# BinaryTree.level_order_traversal(b.root)
puts "---------BFS/level order traversal of Tree One By One----"
BinaryTree.level_order_traversal_line_by_line_sol1(b1.root)
# puts "---------Is both tree are same??----"
# puts BinaryTree.is_identical?(b.root, b1.root)
# puts "---------Deleting Tree??----"
# puts BinaryTree.delete_tree(b.root,b.root)
# puts "----------mirror of binary tree-------------"
# mirrored_tree = BinaryTree.get_mirror_of_tree(b.root)
# BinaryTree.inorder_wid_recursion(mirrored_tree)

# puts "-----Prining all path from root to left--------"
# BinaryTree.root_to_leaf_paths(b.root, [])
