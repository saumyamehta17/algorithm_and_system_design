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

- [Verify Alien Dictionary](https://leetcode.com/problems/verifying-an-alien-dictionary/submissions/)
  `Time Complexity` is o(m*n) and space is o(1)

- [Buy and Sell Stock 1](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
  `Time Complexity` is o(n) and space is o(1)
  
- [Buy and Sell Stock 2](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
  `Time Complexity` is o(n) and space is o(1)
  
- [Trapping Rain Water](https://leetcode.com/submissions/detail/383047611/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n)

- [Trapping Rain Water with space o(1)](https://leetcode.com/submissions/detail/383060059/)
  `Time Complexity` is o(n) and `Space Complexity` is o(1)
  
- [Reorder LinkedList](https://leetcode.com/submissions/detail/384050528/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n) as we are going recursive
  
- [Sum of left leaves](https://leetcode.com/problems/sum-of-left-leaves/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(h) for call stack as we are going recursive.    

- [Minimum Cost For Tickets](https://leetcode.com/submissions/detail/386510911/)
  `Time Complexity` is o(1) and `Space Complexity` is o(1) as we need to process only 365 days

- [Fizz Buzz](https://leetcode.com/problems/fizz-buzz/submissions/)
  `Time Complexity` is o(1) and `Space Complexity` is o(1)

- [Pancake Sorting](https://leetcode.com/problems/pancake-sorting/submissions/)
  `Time Complexity` is o(n^2) and `Space Complexity` is o(n)

- [Min Remove valid parentheses](https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n)

- [Merge Sort](sorting/merge_sort.rb)
  
## System Designs

- [Instagram Design](system_designs/insta.md)
- [Dropbox Design](system_designs/dropbox.md)