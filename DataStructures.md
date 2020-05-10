# Data Structures

	## Array

	  is a data structure, where data is placed at continous memory locatons. Idea is to place multiple items of same type together. 
	  Advantage
	  ---------
	  . Fast random access using index - o(1)

	  Disadvantage
	  ------------
	  . Fix Size
	  . Inserting new elem is expensive if sorted - o(n)
	  . sorting nlog(n)

	## LinkedList

	  a linear data structure, where elements not stored in continous memory locations, elements are linked using pointers.	It do dynamic allocation for each new element.

	  Advantage
	  ---------
	  . Dynamic Size
	  . Ease insertion/deletion - o(1)
	  
	  Disadvantage
	  ------------  
	  . extra space for pointers
	  . No random access, need to traverse - o(n)
	  . sorting nlog(n)

	## Stack-LIFO/ Queue-FIFO(Usage CPU Scheduling)

	  Advantage
	  ---------
	  push/Add - o(1)
	  pop/remove - o(1)
	  peek - o(1)
	  
	  Disadvantage
	  ------------  
	  search - o(n) use another ds

	  Example - Using back and forward buttons in browser.

	## Binary Search Tree
	  hierarchical data structure, 		
	  Advantage
	  ---------
	  * insert/search/del in o(h) 
	  * and in o(log(n)) if bst is self balancing tree
	  * better than hash for get sorted elements (Inorder travsersal), extra efforts with hash
	  * order stastics - get kth smallest elem, extra efforts with hash
	  
	  Disadvantage
	  ------------
	  . extra space


	## Binary Tree
	  hierarchical data structure, type of a tree have atmost 2 children	
	  Advantage
	  ---------
	  
	  Disadvantage
	  ------------

	## Red-Black Tree
	  its a self-balancing binary search tree similar to AVL Tree, but its less restrictive and number of rotations are also less. So, its more efficient.
	  Each node has an extra bit to represent color to ensure that tree remains approximately balanced during the insertions and deletions.

	  Time Complexities of operations are:
	  * Search    	o(logn)
	  * insertions  o(logn)
	  * Deletion    o(logn)

	## Graph
	  Vertices and edges

	  Advantage
	  ---------
	  
	  Disadvantage
	  ------------

	## Trie
	  a tree to store strings
	  
	  Applications
	  ------------
	  searching word in dictonaries

	  
	  Advantage
	  ---------
	  search complexity is o(L) where L is length of string.

	  Disadvantage
	  ------------              
	  It need a lot of memory for storing strings.	

	## Complete Binary Tree
	  Here 2^n nodes at each level, where n is level.Therefore each level has one more node than sum of nodes in all preceding level. So, indexes of children of first node is 2i+1 and 2nd node is 2i+2
	  
	## Heap
	  type of binary tree has following properties:
	  its a complete binary tree where all levels are filled and last level is filled as left as possible. This property makes it suitable to be stored in array
	  It can be MinHeap/MaxHeap

	  
	  Advantage
	  ---------
	  . get min/max  - o(1)
	  . insertion/deletion - o(log(n))

	  Disadvantage
	  ------------   
	  . searching - o(n) bcoz no specific order it maintains

	## Hash
	  
	  Advantage
	  ---------
	  insert/del/access in o(1) 
	  
	  Disadvantage
	  ------------
	  reterival of elem in specific order not gurantee
	  extra space than arrays to store hash code

	## Avl Tree

	  is a balanced Binary Search Tree where height difference b\w left subtree and right subtree is not greater than 1

	  Advantage
	  ---------
	  search, deletion, insertion takes o(logn) where BST can take o(n) if it is skewed.

	  Disadvange
	  -----------
	  may cause more rotations during insertion n deletion.

	## Sorting Algos
	
		- Bubble sort , repeatedly swapping the adjacent elements if they are in wrong order.Can b e optimized by stopping the algorithm if inner loop didn’t cause any swap.
		 worst case - o(n^2)
		 best case - o(n)
		 stable - yes

		- radix sort,  

## Right question:

## Sorting

	what do we know about data: already sorted? mostly sorted? can be there duplicate values? how large data set be?

	what are req for sorting: optimize for best-case, worst-case, average-case? sort need to be stable? 

	what do we know abt system: larger data set to be sorted is smaller than, equal, larger than available memory?
		  

AMAZON
==========
Data Structures:

Array
Linked List
Binary Tree, Binary Search Tree, Red-Black Tree
Heap
Hash Table
Stack
Queue
Trie
Graph (both directed and undirected)
 

Algorithms:

Sorting
Bubble Sort
Merge Sort
Quick Sort
Radix/Bucket Sort
Traversals (On multiple data structures)
Depth First Search
Breadth First Search		  



