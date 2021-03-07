// Inorder, Preorder, Postorder take o(n) space
// Morris approach to traverse the tree will take o(1) space

class MorrisAlgo{

  public static void inorder(TreeNode root){
    TreeNode curr = root;
    while(curr != null){
      if(curr.left == null){
        System.out.print(curr.val + " ");
        curr = curr.right;
      }else{
        TreeNode pre = findPredecessor(curr);

        if(pre.right == null){
           pre.right = curr;
           curr = curr.left;
        }else{
          System.out.print(curr.val + " ");
          curr = curr.right;
          pre.right = null;
        }
      }
    }
  }
  public static void preorder(TreeNode root){
        TreeNode curr = root;
        while(curr != null){
            if(curr.left == null){
                System.out.print(curr.val + " ");
                curr = curr.right;
            }else{
                TreeNode succ = findPredecessor(curr);
                if(succ.right == null){
                    System.out.print(curr.val + " ");
                    succ.right = curr;
                    curr = curr.left;
                }else{
                    curr = curr.right;
                    succ.right = null;
                }
            }
        }
    }
  public static void postorder(TreeNode root){
    TreeNode curr = root;
    while(curr != null){
      if(curr.right == null){
        System.out.print(curr.val + " ");
        curr = curr.left;
      }else{
        TreeNode succ = findSuccessor(curr);
        if(succ.left == null){
           succ.left = curr;
           curr = curr.right;
        }else{
          System.out.print(curr.val + " ");
          succ.left = null;
          curr = curr.left;
        }
      }
    }
  }

  public static TreeNode findSuccessor(TreeNode node){
    TreeNode curr = node;
    node = curr.right;
    while(node.left != null && node.left != curr){
        node = node.left;
    }
    return node;
  }

  public static TreeNode findPredecessor(TreeNode node){
    TreeNode curr = node;
    node = curr.left;
    while(node.right != null && node.right != curr){
        node = node.right;
    }
    return node;
  }

  public static void main(String[] args){
      TreeNode root = new TreeNode(10);
      root.left = new TreeNode(5);

      root.left.left = new TreeNode(-2);
      root.left.left.left = new TreeNode(2);
      root.left.left.right = new TreeNode(-1);

      root.left.right = new TreeNode(6);
      root.left.right.right = new TreeNode(8);

      root.right = new TreeNode(30);
      root.right.right = new TreeNode(40);
      System.out.println("Inorder Morris");
      inorder(root);
      System.out.println("\nPostorder Morris");
      postorder(root);
      System.out.println("\nPreorder Morris");
      preorder(root);
  }

}

class TreeNode{
  int val;
  TreeNode left;
  TreeNode right;
  public TreeNode(int val){
    this.val = val;
    this.left = this.right = null;
  }
}