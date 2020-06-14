def largest_divisible_subset(nums)
  n = nums.length
  nums = nums.sort
  count_arr = Array.new(n, 1)
  max_indx = 0

  for i in 1...n
    for j in 0...i
      if nums[i] % nums[j] == 0
        if count_arr[i] <= count_arr[j]
          count_arr[i] = count_arr[j] + 1
        end
      end
    end

    if count_arr[max_indx] < count_arr[i]
      max_indx = i
    end
  end
  arr = []
  elem = nums[max_indx]
  current_count = count_arr[max_indx]
  while(max_indx >= 0)
    if elem % nums[max_indx] && current_count == count_arr[max_indx]
      arr << nums[max_indx]
      current_count -= 1
    end
    max_indx -= 1
  end
  arr
end

nums = [3,81,9]
# nums = [2,5,6,10,20,25]
nums = [1,2,6,7]
nums = [2,3]
arr = largest_divisible_subset(nums)
puts arr.to_s

def largest_divisible_subsetusing_prev_arr(nums)

  n = nums.length
  return nums if n <= 1
  nums = nums.sort
  count_arr = Array.new(n, 0)
  max_indx = 0
  prev_arr = Array.new(n, -1)

  for i in 1...n
    for j in 0...i
      if nums[i] % nums[j] == 0
        if count_arr[i] < (count_arr[j] + 1)
          count_arr[i] = count_arr[j] + 1
          prev_arr[i] = j
        end
      end
    end
    if count_arr[max_indx] < count_arr[i]
      max_indx = i
    end
  end
  arr = []
  while(max_indx >= 0)
    arr << nums[max_indx]
    max_indx = prev_arr[max_indx]
  end
  arr
end