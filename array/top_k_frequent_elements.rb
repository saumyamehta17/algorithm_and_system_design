## Using Quick Sort
# Time Complexity - n(logk)

def top_k_frequent(nums, k)
  _h = Hash.new(0)
  nums.each do |n|
    _h[n] += 1
  end

  pairs = _h.map{|k,v| [k,v]}

  get_top_k_nums(pairs, 0, pairs.length-1, k)
  puts pairs.to_s
  # puts pairs.take(k).map {|i| pairs[1]}.to_s
end

def get_top_k_nums(pairs, left, right, k)
  if left <= right
    mid = partition(pairs, left, right)
    if mid == k-1
      return
    elsif mid < k-1
      get_top_k_nums(pairs, mid + 1, right, k)
    else
      get_top_k_nums(pairs, left, mid - 1, k)
    end
  end
end

def partition(pairs, left, right)
  pivot = pairs[right].last
  i = j = left

  while(i < right)
    if pairs[i].last >= pivot
      j += 1
      swap(pairs, i, j) if i != j
    end
    i += 1
  end
  swap(pairs, right, j) if right != j
  j
end

def swap(pairs, i, j)
  tmp = pairs[i]
  pairs[i] = pairs[j]
  pairs[j] = tmp
end
nums = [1,1,1,2,2,3], k = 2
top_k_frequent(nums, k)