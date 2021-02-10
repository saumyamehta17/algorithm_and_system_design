# Segment Tree is binary tree created from an array
# UseCase: Find min, max, sum in a certain range in o(logN) time and o(N) space
# Without it, array will take o(N) time which is huge if array size is in million
# other alternative is to use matrix to store results and give res in o(1) but space would be o(n**2) which is huge for million
# size of segment tree calculated by power of 2 for give array size, if array size is not perfect power of 2 then find next perfect power
# for example: array_size = 4, which is perfect, so segment tree size = power*2-1 = 4*2-1 = 7
# for example: array_size = 6, which is not perfect and next perfect power is 8, so segment tree size = power*2-1 = 8*2-1 = 15
# constructing segment tree(conceptually)/array(real) will take o(N)

# Create Segment Tree Array from Given Array
def construct_segment_tree(input_arr, segment_arr, low, hi, pos)
  if(low == hi)
    segment_arr[pos] = input_arr[low]
    return
  end

  mid = (low+hi)/2
  construct_segment_tree(input_arr, segment_arr, low, mid, pos*2+1) #left
  construct_segment_tree(input_arr, segment_arr, mid+1, hi, pos*2+2) #right
  segment_arr[pos] = [segment_arr[pos*2+1], segment_arr[pos*2+2]].min
end

input_arr = [-1,2,4,0]; len = input_arr.length
hi = len-1
while(Math.sqrt(len) != Math.sqrt(len).to_i)
  len += 1
end
segment_arr = Array.new(len)
construct_segment_tree(input_arr, segment_arr, low, hi, 0)
# segment_arr would be -> [-1,-1,0,-1,2,4,0]

# Range Query, time complexity o(logn)
# Partial Overlap, check left and right direction
# Total Overlap -> range completely comes under given range, return val
# No Overlap -> range is will not contribute to find ans for given range, then return max value
# taking a above created segment array
def find_min_from_range(segment_arr, qlow, qhi, low, hi, pos)
  if(qlow <= low && qhi >= hi) # total overlap
    return segment_arr[pos]
  elsif(qlow > hi || qhi < low) # No Overlap
    return Integer::INFINITY
  end

  mid = (low+hi)/2
  [find_min_from_range(segment_arr, qlow, qhi, low, mid, pos*2+1),
   find_min_from_range(segment_arr, qlow, qhi, mid+1, hi, pos*2+2)].min
end
qlow = 1
qhi = 3
find_min_from_range(segment_arr, qlow, qhi, 0, 3, 0)