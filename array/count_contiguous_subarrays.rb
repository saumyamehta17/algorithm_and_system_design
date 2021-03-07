/*
    You are given an array a of N integers. For each index i, you are required to determine the number of contiguous subarrays that fulfills the following conditions:
    The value at index i must be the maximum element in the contiguous subarrays, and
    These contiguous subarrays must either start from or end with i.
    Output
    An array where each index i contains an integer denoting the maximum number of contiguous subarrays of a[i]
    Example:
    a = [3, 4, 1, 6, 2]
    output = [1, 3, 1, 5, 1]

    Explanation:
    For index 0 - [3] is the only contiguous subarray that starts (or ends) with 3, and the maximum value in this subarray is 3.
    For index 1 - [4], [3, 4], [4, 1]
    For index 2 -[1]
    For index 3 - [6], [6, 2], [1, 6], [4, 1, 6], [3, 4, 1, 6]
    For index 4 - [2]
    So, the answer for the above input is [1, 3, 1, 5, 1]
*/


# Following is with o(n) time complexity
def count_subarrays(arr)
  # Write your code here
  len = arr.length
  left_arr = Array.new(len, 1)
  right_arr = Array.new(len, 1)
  s = []
  # going from left
  for i in 0...len
     while(!s.empty? && arr[s.last] < arr[i])
       left_arr[i] += left_arr[s.pop]
     end
     s.push(i)
  end


  s = []
  # going from right
  (len-1).downto(0).each do |i|
     while(!s.empty? && arr[s.last] < arr[i])
       right_arr[i] += right_arr[s.pop]
     end
     s.push(i)
  end

  for i in 0...len
    left_arr[i] += (right_arr[i] - 1)
  end
  left_arr
end

# Call count_subarrays() with test cases here
tcs = [
    [3, 4, 1, 6, 2],    # => [1, 3, 1, 5, 1]
    [2, 4, 7, 1, 5, 3], # => [1, 2, 6, 1, 3, 1]
    [1]                 # => [1]
    ]

tcs.each do |tc|
  print count_subarrays(tc).to_a
end

