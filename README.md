## Algorithm

- [Top k frequent elements](/array/top_k_frequent_elements.rb)
  `Time Complexity` is o(n) as I am processing each node only once in a tree **and** `Space Complexity` o(n) as adding each node in queue(BFS)
  
- [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

  Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
  #### Complexity Analysis
    `Time Complexity` is o(n) as we are processing string once **and** `Space Complexity` is o(1)

- [Find All Duplicates](https://leetcode.com/problems/find-all-duplicates-in-an-array/submissions/)

  #### Complexity Analysiss
     `Time Complexity` is o(n) as we are processing string once **and** no extra `space`

- [Rotten Oranges](https://leetcode.com/problems/rotting-oranges/submissions/)

  #### Complexity Analysis
     `Time Complexity` is o(m*n) **and** `space complexity` is also o(m*n)       

### Array

- [Find Missing Number](https://leetcode.com/problems/missing-number/submissions/) 
  #### Complexity Analysis
     `Time Complexity` is o(n) **and** `space complexity` is also o(1)

- [Majority Elements ||](https://leetcode.com/problems/majority-element-ii/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(1)

- [Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(1)

- [Largest Number](https://leetcode.com/problems/largest-number/submissions/)
  `Time Complexity` is o(nlogn) and `Space Complexity` is o(n)
  
- [Pascal's Triangle](https://leetcode.com/problems/pascals-triangle-ii/submissions/)
  
  `Time Complexity` is o(n) and space is o(1). And n = number of index given

- [First Missing Positive](https://leetcode.com/problems/first-missing-positive/submissions/)
    `Time Complexity` is o(n) and `Space Complexity` is o(1)

- [Prison Cells After N days](https://leetcode.com/submissions/detail/409319545/)
  `Time Complexity` is o(64), as it can maximum goes to 2**6. `Space` is o(64)

- [Minimum Cost to Move Chips to The Same Position](https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/submissions/)
  `Time Complexity` is o(n) and `Space` is o(1)

- [Buy and Sell Stock 1](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
  `Time Complexity` is o(n) and space is o(1)
  
- [Buy and Sell Stock 2](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
  `Time Complexity` is o(n) and space is o(1)

- [Trapping Rain Water](https://leetcode.com/submissions/detail/383047611/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n)

- [Trapping Rain Water with space o(1)](https://leetcode.com/submissions/detail/383060059/)
  `Time Complexity` is o(n) and `Space Complexity` is o(1)
      
- [Verify Alien Dictionary](https://leetcode.com/problems/verifying-an-alien-dictionary/submissions/)
  `Time Complexity` is o(m*n) and space is o(1)
  
- [Minimum Cost For Tickets](https://leetcode.com/submissions/detail/386510911/)
  `Time Complexity` is o(1) and `Space Complexity` is o(1) as we need to process only 365 days

- [Fizz Buzz](https://leetcode.com/problems/fizz-buzz/submissions/)
  `Time Complexity` is o(1) and `Space Complexity` is o(1)

- [Pancake Sorting](https://leetcode.com/problems/pancake-sorting/submissions/)
  `Time Complexity` is o(n^2) and `Space Complexity` is o(n)

- [Min Remove valid parentheses](https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n)

- [Merge Sort](sorting/merge_sort.rb)

- [Reverse words in string](string_algos/reverse_words_in_string.rb)

- [Bulls and Cows](https://leetcode.com/problems/bulls-and-cows/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(1) because digits are fixed which is 0 to 9

- [Evaluate Division](https://leetcode.com/problems/evaluate-division/submissions/)
  - m = no of queries, n = no of equation
  `Time Complexity` is o(m*n) and `Space Complexity` is o(n)

- [Website Visit Pattern](leet_code/website_visit_pattern.rb)

      
 ### LinkedList
 - [Pallindrome LinkedList](https://leetcode.com/problems/palindrome-linked-list/submissions/)
   Best Solution `Time Complexity` is o(n) and `Space Complexity` is o(1)
   
  - [Reorder LinkedList](https://leetcode.com/submissions/detail/384050528/)
    `Time Complexity` is o(n) and `Space Complexity` is o(n) as we are going recursive
    
  - [Merge Two sorted List](https://leetcode.com/problems/merge-two-sorted-lists/submissions/)
  `Time Complexity is o(m+n)`
  
  - [Insertion Sort List](https://leetcode.com/problems/insertion-sort-list/submissions/)
  `Time Complexity` is o(n^2) and `Space Complexity` is o(1)
  
 ### Tree
 
 - [Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/submissions/)         
   `Time Complexity` is o(n) and `Space Complexity` is o(n)
   
 - [Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/submissions/)
  `Time Complexity` is o(n) and `Space Complexity` is o(n)
 
 - [Sum of Root To Leaf Binary Numbers](https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/submissions)
   `Time Complexity` is o(n) and `Space Complexity` is o(n)
   
- [Max Path Sum in Binary Tree](https://leetcode.com/problems/binary-tree-maximum-path-sum/submissions/)
  `Time Complexity` is o(n) as we are touching each node once and space is o(h) for average case but o(n) for worst case if tree is skewed
     because in recursion, call stack is being taking place for nodes
 
 - [Binary Tree Level Order zigzag](/tree/zigzag_level_order.rb)
 
 - [Max Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/submissions/)
   Its maximum width among all levels
   
 - [Delete Node from BST](tree/delete_node_in_bst.rb)
 
 - [Sum of left leaves](https://leetcode.com/problems/sum-of-left-leaves/submissions/)
    `Time Complexity` is o(n) and `Space Complexity` is o(h) for call stack as we are going recursive.
## System Designs

- [Instagram Design](system_designs/insta.md)
- [Dropbox Design](system_designs/dropbox.md)