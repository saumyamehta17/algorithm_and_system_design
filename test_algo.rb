# Given an unsorted array of size N. Find the first element in array such that 
# all of its left elements are smaller and all right elements to it are greater 
# than it.

# Note: Left and right side elements can be equal to required element. 
# And extreme elements cannot be required element.


# 3

# 4
# 4 2 5 7
# 3
# 11 9 12
# 6
# 4 3 2 7 8 9

# 5
# -1
# 7

# Input:   arr[] = {5, 1, 4, 3, 6, 8, 10, 7, 9};
# Output:  Index of element is 4
# All elements on left of arr[4] are smaller than it
# and all elements on right are greater.
# i = 8 max = 6  min =  mid_point = 6
# Input:   arr[] = {5, 1, 4, 4};
# Output:  Index of element is -1
