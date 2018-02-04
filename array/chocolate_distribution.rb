# Given an array A[] of N integers where each value represents number of chocolates 
# in a packet. Each packet can have variable number of chocolates. There are m students,
#  the task is to distribute chocolate packets such that :
# 1. Each student gets one packet.
# 2. The difference between the number of chocolates given to the students in 
# packet with maximum chocolates and packet with minimum chocolates is minimum.

# Input : A[] = {3, 4, 1, 9, 56, 7, 9, 12} , 1,3, 4, 7, 9, 9, 56, 12
# 
#         m = 5
# Output: "Minimum Difference is" 6
# We may pick 3,4,7,9,9 and the output 
# is 9-3 = 6
# Complexity o(log(n)) for sorting only

def distribution(arr, n, m)
  return 'Not valid input' if n < m

  arr = arr.sort

  diff = arr[m-1] - arr[0]

  l = 1; r = m

  while(l < n && r < n)
    new_diff = (arr[r] - arr[l])
    if(new_diff >= diff)
      return [diff, l-1, r-1]
    else
      diff = new_diff
      l += 1; r += 1
    end  
  end

  return "Something Went Wrong"  
end  
# arr = [3, 4, 1, 9, 56, 7, 9, 12]
arr = [7, 3, 2, 4, 9, 12, 56]
n = arr.length
# m = 5
m = 3

res = distribution(arr, n, m)
puts "Minimum Difference is #{res[0]}"