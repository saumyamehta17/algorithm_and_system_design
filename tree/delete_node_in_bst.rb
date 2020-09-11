# Problem: https://leetcode.com/problems/delete-node-in-a-bst/
# Submission: https://leetcode.com/problems/delete-node-in-a-bst/submissions/
require '../tree/bst_tree'

def delete_node(root, key)
  return root if root.nil?

  if root.val > key
    root.left = delete_node(root.left, key)
    return root

  elsif root.val < key
    root.right = delete_node(root.right, key)
    return root

  # Below cases matches with key
  elsif root.left.nil?  # no children or no left child
    return root.right
  elsif root.right.nil?   # no children or no right child
    return root.left
  else # have both children
    left = root.right.left
    root.right.left = root.left
    root = root.right
    if left
      curr = root.left
      while(curr.right)
        curr = curr.right
      end
      curr.right = left
    end
    return root
  end
end

root = create_bst
key = 6 # No left child
new_root = delete_node(root, key)
# print_bst(new_root)

key = 4 # No child

key = 3 # Have Both child

key = 5 # Root Node

key = 6 # No left child

# delete_node(root, key)