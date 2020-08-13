## Algorithm

- [Top k frequent elements](/array/top_k_frequent_elements.rb)

- [Binary Tree Level Order zigzag](/tree/zigzag_level_order.rb)

- [Max Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/submissions/)
  Its maximum width among all levels
  
  #### Complexity Analysis
  `Time Complexity` is o(n) as I am processing each node only once in a tree **and** `Space Complexity` o(n) as adding each node in queue(BFS)
  
- [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

  Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
  #### Complexity Analysis
    `Time Complexity` is o(n) as we are processing string once **and** `Space Complexity` is o(1)

- [Find All Duplicates](https://leetcode.com/problems/find-all-duplicates-in-an-array/submissions/)

  #### Complexity Analysis
     `Time Complexity` is o(n) as we are processing string once **and** no extra `space`

- [Rotten Oranges](https://leetcode.com/problems/rotting-oranges/submissions/)

  #### Complexity Analysis
     `Time Complexity` is o(m*n) **and** `space complexity` is also o(m*n)       

- [Find Missing Number](https://leetcode.com/problems/missing-number/submissions/) 
  #### Complexity Analysis
     `Time Complexity` is o(n) **and** `space complexity` is also o(1)

- [Max Path Sum in Binary Tree](https://leetcode.com/problems/binary-tree-maximum-path-sum/submissions/)

  #### Complexity Analysis      
    `Time Complexity` is o(n) as we are touching each node once and space is o(h) for average case but o(n) for worst case if tree is skewed
     because in recursion, call stack is being taking place for nodes

- [Pascal's Triangle](https://leetcode.com/problems/pascals-triangle-ii/submissions/)
  
  `Time Complexity` is o(n) and space is o(1). And n = number of index given
          
- ToDo Next
  https://leetcode.com/problems/verifying-an-alien-dictionary/
  https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
  
## System Designs

- [Instagram Design](system_designs/insta.md)