# using inorder is given on leetcode
# https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3339/


Node = Struct.new(:val, :left, :right)

def bst(preorder, min_val = -4611686018427387903, max_val = 4611686018427387903)
  if !preorder.empty? && preorder[0] > min_val && preorder[0] < max_val
    node = Node.new(preorder.shift)
    node.left = bst(preorder, min_val, node.val)
    node.right = bst(preorder, node.val, max_val)
    return node
  end
end


preorder = [10, 8, 6, 7, 15, 11, 19]
puts bst(preorder)